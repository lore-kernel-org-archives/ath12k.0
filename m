Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09D74C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 15:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L9sYH1kb7A030SMqqfDgqNZWBvhzFyEZZNdCpfgIS2c=; b=R6uGuQCKiH+jHU
	ufMzrumhkKkaSB++pPLXsGVl5zsFVBsPnBCpxkwO+Ehxtl03eNnNnunfKi44OD84nVqKoJhCnwbSr
	BehNbWU1eK2mZljrO2BfMis+H7tjbDjN8jTHoi/SUF9zkXYiZKjB5zglgu2rFE14i7giUQ7n3fCW6
	W4Sgenr1ARJ0lz8FFMFIrZWHbBF7GG1DynZDBUZcF0HCm9RekNDAdQjhhsi6K0pxRKkepuYjlkSic
	uSl0DXmwATZ8kc74KUY7Ru2fb8id2i9Zk4CkOTRjl0rqSX2nKNDLrOL1wNIfX4vvrr5f1t4lub/kJ
	BU6A6pwcJsatjnajmvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSfkg-00Amit-FC
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 15:00:50 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSenV-00ATkB-20
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 13:59:42 +0000
Received: by mail-ed1-x52e.google.com with SMTP id v11so661120edx.12
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 05:59:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jnjytPgjEFORI/zduhnQV750Ik3TCjQTMOCelgURllc=;
        b=AjVAajwzKC0pkhmx9YL3OZG33saaHocATzrwJcVx2bC/Ga/saG99d0MstJUybWlHNa
         k2Vfhh6lotH3v9YVXaQpitJWrlrR5vkVqI1q5gWIAo037heo7V1YFnY+U/DpoEhr6pP1
         OVFFIFERZDc/Uk7WQwQUvXl1L6RDHOPBqTTyc75SrXJbg5MsCaUNlxp4i+JRIYOGwtqz
         +h5NumXjMyd+IbQCt67qZD6H8M7jYfB+0w/GFcfhuZEiM/LssKVg5Q4NPcIazAB8H0xC
         7Cz6oo/1HaV7/eEUKEH4LwG/Hy3wl//2IilYlpWrj8iaGvvXZ1yeQYMLU9jnEArI7X7x
         hnQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jnjytPgjEFORI/zduhnQV750Ik3TCjQTMOCelgURllc=;
        b=sAo9uVvCguVMA/vTofCumBmetLCdD+eV3ezeopAHZFNds5Ixin/3cJxry3c+78utLw
         6ElXSVFRRCX27bLs9osNnXBr2YwsYchny0DQ4NoNFJyb6V/rj/pA/bYapYccGagiaV7C
         nU8KNV0kn3EqWLaInNZsHDyXrwf9nd2bNKAVAgy1cL8ZaKVPHNTKpztxUqr/kO7Ro4mM
         ZlMlH85h/JoK7ot03Tun+962WevG7sCMHFFAYpZqIN10RfmyFQIQahgp4/ftaS7rtWLU
         RVHlY4ufC4XBsdkeIFYZKq9rgAFmsccx3IWnh3t030Z3X/+qrgVI+T/jIvRpmJ8rQwaP
         hZSQ==
X-Gm-Message-State: AO0yUKW2HuLcnaDc1gtx6xfzmh2s50o+WpGb8SQjANwTIM6SmL0glc/C
	EE6GoXGFuYCaPI6fzi6m08uF/njabWbiLw==
X-Google-Smtp-Source: AK7set8lgI/XnSlKY1VzzQRRlLB3f3sLpu/0YAloZT6YQJlku5dflqfUY4TBWZaT3r8XCMr7/4ngrg==
X-Received: by 2002:a17:907:6e0d:b0:88f:a23e:6f0d with SMTP id sd13-20020a1709076e0d00b0088fa23e6f0dmr7716709ejc.37.1676555976608;
        Thu, 16 Feb 2023 05:59:36 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id bw10-20020a170906c1ca00b008b133f9b33dsm842546ejb.169.2023.02.16.05.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 05:59:36 -0800 (PST)
Date: Thu, 16 Feb 2023 16:59:27 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: return literal zeroes
Message-ID: <Y+42v5TLeL65Zidp@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_055941_119732_C0BF85A6 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hello Kalle Valo,

The patch d889913205cf: "wifi: ath12k: driver for Qualcomm Wi-Fi 7
devices" from Nov 28, 2022, leads to the following Smatch static
checker warning:

drivers/net/wireless/ath/ath12k/dp.c:772 ath12k_wbm_idle_ring_setup() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/htc.c:712 ath12k_htc_connect_service() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/mac.c:990 ath12k_mac_monitor_vdev_delete() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/mac.c:4841 ath12k_set_he_mu_sounding_mode() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/core.c:568 ath12k_core_start_firmware() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/dp_rx.c:980 ath12k_dp_rx_peer_tid_setup() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/dp_rx.c:1091 ath12k_dp_rx_ampdu_stop() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/qmi.c:2799 ath12k_qmi_event_server_arrive() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/qmi.c:2813 ath12k_qmi_event_mem_request() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/qmi.c:2960 ath12k_qmi_ops_new_server() info: returning a literal zero is cleaner
drivers/net/wireless/ath/ath12k/qmi.c:3077 ath12k_qmi_init_service() info: returning a literal zero is cleaner

drivers/net/wireless/ath/ath12k/dp.c
    760         *n_link_desc = n_mpdu_link_desc + n_mpdu_queue_desc +
    761                       n_tx_msdu_link_desc + n_rx_msdu_link_desc;
    762 
    763         if (*n_link_desc & (*n_link_desc - 1))
    764                 *n_link_desc = 1 << fls(*n_link_desc);
    765 
    766         ret = ath12k_dp_srng_setup(ab, &dp->wbm_idle_ring,
    767                                    HAL_WBM_IDLE_LINK, 0, 0, *n_link_desc);
    768         if (ret) {
    769                 ath12k_warn(ab, "failed to setup wbm_idle_ring: %d\n", ret);
    770                 return ret;
    771         }
--> 772         return ret;

Better to return 0;

    773 }

The rest are the same but especially this one would be better as a
literal because it's in the middle of a function:

drivers/net/wireless/ath/ath12k/dp_rx.c:980 ath12k_dp_rx_peer_tid_setup() info: returning a literal zero is cleaner

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
