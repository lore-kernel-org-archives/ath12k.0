Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B977C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hcK6fv0SWZHhWevqgm0X2HDSt6jBC4oBG/iTqy/TzqM=; b=IU86VBsok5GRVn
	dpUfm2LPbSv/sBjP5KsSmWhVlfR/yfEOBJm4CzsWOfXMAnMGWktSbuBV3wWHwGiA1lXaYuJFsNd04
	qwp5pcOZ/o8JZ3HBOvogoTZvJ0IEg0vbqv1aJsrEMPUT5CIEjrHf3bf6yoNsLlbxo4wR2DQPDvzEH
	jOTa83vOmlgjm6nMdl/Wi8sUqOJIcduR/SRhRJWCkThNkFQGYkNIZl8GErxF/C/UoQFoo+n0ARXhu
	0lhLdD+WNdP4e7ZjdUK88dPvfyBDpLrfHzqdRK1hTrtWOc0q2JwenK0ixaHl/6SjlLSmufGuGnj8X
	uOzoJbAu1VRvLVJ+Vhvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoh-00AU3u-Vt
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:55 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeof-00AU33-Ge
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:54 +0000
Received: by mail-ed1-x529.google.com with SMTP id eq11so3124884edb.6
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SjFCGAOdY39y0BwwErOL9yvr1prU6evsLq427+C4T7s=;
        b=VYOJQI32hbhk4Ykifa4NgzeKYNO2eXZetRY6z3XfYLKTH6m8geu2PJeTpTYgqzbrqq
         CfyI5EOI8yv+2VmYDNgAZtS1b5OZzfY+Qx49rt97rOIRznkivoCShtGkH3QJrF1yHwql
         CS3DYR2bv9DZpZK5AjOBN1n9FLBceIxZTJmIawgoFbKALHVhvWzUXNGwH4Iq5zb+a1vJ
         FFgiZfxz6tlQXbI6Glqn/pYno+ywyzBB/Kad7pGFWHItxpHfkmXLzEmOMYcPixfNfFRI
         eE+wg4Sgx5aQtB0FwuyDIUc6KfnDO2Y2VeOpEO/0nHkuWJqQCV+tPVO3RCdfRbyD7+8F
         8yAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SjFCGAOdY39y0BwwErOL9yvr1prU6evsLq427+C4T7s=;
        b=kVmHMk7OX7QmsTXz0jWpgMEM48kkPJCJKWAtzLY1/EXrhOcqavJMJUSi1BNaBw6o06
         6cPzYNHRHdxAUOV4/lHBo+mt33MMkxM2qnFlxpvuVLIvZygqs1EqHOU6CxQcEB2LLvOw
         PaCsGLcybGeiUqFkiNsTFPtfqdo3I0SQEhlhhCOwrJVI0iIgtBF3tAemlVrrdPFZlnLN
         yhaLO3iIyetjQc3VoP6PY4IVpCo05xlf1y2P2lPVuGTz326HaAnQ/zwrwb+Y/RxH/QqY
         LC2nqlyEvn3XYaMSGOjl9p3y1eR7ioEEVVcjcMg3eHgmvnK1eV0AuZIPJuLScnzeYyDb
         bVLQ==
X-Gm-Message-State: AO0yUKXk4XO2wY0W1ZhRT5BmP0ZMSmlM/McTXd/A7dAzGy5PU29SUCKd
	86oRMCNIXn/BISU5IQ/jyjY=
X-Google-Smtp-Source: AK7set9IFUcv9Z7oeFQ/WnJihJ+mNkdHupv2lY4QXXdO2qSfi4ch7o01ouj9rIuiLvqdPZ0E0kG07Q==
X-Received: by 2002:aa7:c40b:0:b0:4aa:a390:bf4a with SMTP id j11-20020aa7c40b000000b004aaa390bf4amr5610914edq.20.1676556052224;
        Thu, 16 Feb 2023 06:00:52 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id z3-20020a50cd03000000b004ad1d58a6d0sm908290edi.56.2023.02.16.06.00.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:51 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:48 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: strange memcpy()
Message-ID: <Y+43EKgs3NELwMO1@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060053_571326_55A4D4AD 
X-CRM114-Status: UNSURE (   6.02  )
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

	drivers/net/wireless/ath/ath12k/wmi.c:2737 ath12k_wmi_send_init_country_cmd()
	warn: not copying enough bytes for '&cmd->cc_info.alpha2' (4 vs 3 bytes)

drivers/net/wireless/ath/ath12k/wmi.c
    2715 int ath12k_wmi_send_init_country_cmd(struct ath12k *ar,
    2716                                      struct ath12k_wmi_init_country_arg *arg)
    2717 {
    2718         struct ath12k_wmi_pdev *wmi = ar->wmi;
    2719         struct wmi_init_country_cmd *cmd;
    2720         struct sk_buff *skb;
    2721         int ret;
    2722 
    2723         skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, sizeof(*cmd));
    2724         if (!skb)
    2725                 return -ENOMEM;
    2726 
    2727         cmd = (struct wmi_init_country_cmd *)skb->data;
    2728         cmd->tlv_header =
    2729                 ath12k_wmi_tlv_cmd_hdr(WMI_TAG_SET_INIT_COUNTRY_CMD,
    2730                                        sizeof(*cmd));
    2731 
    2732         cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
    2733 
    2734         switch (arg->flags) {
    2735         case ALPHA_IS_SET:
    2736                 cmd->init_cc_type = WMI_COUNTRY_INFO_TYPE_ALPHA;
--> 2737                 memcpy(&cmd->cc_info.alpha2, arg->cc_info.alpha2, 3);

These are u32s, so it's strange to only copy 3 bytes.  It looks
intentional because of the 3, but it's still strange.

    2738                 break;
    2739         case CC_IS_SET:
    2740                 cmd->init_cc_type = cpu_to_le32(WMI_COUNTRY_INFO_TYPE_COUNTRY_CODE);
    2741                 cmd->cc_info.country_code =
    2742                         cpu_to_le32(arg->cc_info.country_code);
    2743                 break;
    2744         case REGDMN_IS_SET:
    2745                 cmd->init_cc_type = cpu_to_le32(WMI_COUNTRY_INFO_TYPE_REGDOMAIN);
    2746                 cmd->cc_info.regdom_id = cpu_to_le32(arg->cc_info.regdom_id);
    2747                 break;
    2748         default:
    2749                 ret = -EINVAL;
    2750                 goto out;
    2751         }
    2752 
    2753         ret = ath12k_wmi_cmd_send(wmi, skb,
    2754                                   WMI_SET_INIT_COUNTRY_CMDID);
    2755 
    2756 out:
    2757         if (ret) {
    2758                 ath12k_warn(ar->ab,
    2759                             "failed to send WMI_SET_INIT_COUNTRY CMD :%d\n",
    2760                             ret);
    2761                 dev_kfree_skb(skb);
    2762         }
    2763 
    2764         return ret;
    2765 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
