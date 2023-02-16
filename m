Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D30C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oGoEaaonOtkEJ+wyHtPPC/wK0IXNxpy7Dvo7W0QabZI=; b=CSmdXaeoik7Iix
	oxJyJC1q04oILoeVqiZ2h2Z/RhywUOoLnYjY8od96G3fYdJQqZSX8/ehWru1oAAyhpF973Paf2x91
	4zrt+P4Xru0obdOB4Q4e6OG8ieEuPeV61UbzeTMbEXhGcpgzTJk0vCvyp0ZfBUCsqHu+v213d9fNy
	KhFhe9/LLpF5YyAqLL7qLH0fg4brnUuJcLdsds8RUtKDE+1I5duyRbNpQ9Wc7HwdIFzMW12gPL/a7
	AEYYSF4S+tKhffwMJGc9BzF/5WdSWzc2t8S41d5vKM6nBM0Rh0NEHpgW0IPhPhJ/QSr6r8hS9W4Ve
	eJdpibI3NZcp8HGvYAkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoA-00ATwm-Uy
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:22 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeo8-00ATuo-Ix
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:21 +0000
Received: by mail-ed1-x529.google.com with SMTP id w3so3143892edc.2
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0jessfGxLyy7OlNlyD5MYHYRyTI9Jb37IhwhAOttInw=;
        b=GuMdRTyITJYDDH3BWTAHLKGjR1oO/cD6yNGPHlc9lKLDpk8Dz51zQtwIPC91Q6o7z8
         oqMzzxGK94wapyfgYF/1YFXZQgsZHQkb/OgKDoelYfbVqXkoRVsV6AzIa0+dJsxiTfyz
         oJu4/EmVPtWyZYLVL+bwTcLSLroAzIbrI5JVTyEAWSxYSBBSxdnuv8hfIIcGVdrWrc8S
         AH5/AYYobtk5s6eMn2zO9csTMtZzuWMAr5k9OCLh7OcO7xwFDtyFCp+YId4Dk7t8IJvb
         Mp52io25jJkxTM/hBSAQMTqKP9/evaS8eMxuR+YQ5wo42r4MWsYugROO8juo8ZoSCMVY
         WyWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0jessfGxLyy7OlNlyD5MYHYRyTI9Jb37IhwhAOttInw=;
        b=AodE9qHyDQANL3RRLjb+uUVulHPtDkBf6sZmW5kh/oM+rCc/67tMQQbE5mgPa5PWc9
         f/kUpwSBQPxAdpaxnimDh9FOcmfJ+MCdcCO8mH0TmvahIictj0iBh+xvnjp7cFs4ujOq
         GQAjmaR4G0JWnapOTU9nCwepN5MMcXSHZsSfYy8sdgV3Tk5dddsTzGUiHgFyDAyAFBRk
         XgZXj5xjEnOLVmwOvmzXoLxB2rB2n+kf8DVO/ZeiBOC+h9yJIG3ovTlDPBHK8iZh/3iw
         GtZnf/V+RGxe0k6BJqYET8ywocNnV/ssDzOnlSuXgNzowXRK6verpXBNndN0cX5p65C/
         0QqQ==
X-Gm-Message-State: AO0yUKV8sS0FRoz38mbD3rH4fsgbEe1wq17uELJSQitXS31LAEXvoquo
	ced3e/0oc54FsdCI8eH4eRRLHldSI56trQ==
X-Google-Smtp-Source: AK7set9liknlFhcdwpSsGij5LD0Ab/pHl3tuNxO1ruvoLp3it9UvqqjI5MAHuK7IS4gQ1fpnwLC3hA==
X-Received: by 2002:a17:906:c02:b0:7c4:fa17:7203 with SMTP id s2-20020a1709060c0200b007c4fa177203mr6126662ejf.63.1676556020215;
        Thu, 16 Feb 2023 06:00:20 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id x16-20020a170906711000b008b17879ec95sm218777ejj.22.2023.02.16.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:19 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:16 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: duplicate checks
Message-ID: <Y+428K5KOrDGaCw+@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060020_645934_355D76BF 
X-CRM114-Status: UNSURE (   5.65  )
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

drivers/net/wireless/ath/ath12k/mac.c:5809 ath12k_mac_op_assign_vif_chanctx() warn: 'arvif->vdev_type == 4' 'false' implies 'arvif->vdev_type != 4' is 'true'
drivers/net/wireless/ath/ath12k/dp_rx.c:1369 ath12k_update_per_peer_tx_stats() warn: 'mcs > 11' 'false' implies 'mcs > 11' is 'false'
drivers/net/wireless/ath/ath12k/dp_rx.c:1329 ath12k_update_per_peer_tx_stats() warn: address of 'ppdu_stats->user_stats[user]' is non-NULL

drivers/net/wireless/ath/ath12k/mac.c
    5792 
    5793         if (arvif->vdev_type == WMI_VDEV_TYPE_MONITOR) {

type checked here

    5794                 ret = ath12k_mac_monitor_start(ar);
    5795                 if (ret)
    5796                         goto out;
    5797                 arvif->is_started = true;
    5798                 goto out;
    5799         }
    5800 
    5801         ret = ath12k_mac_vdev_start(arvif, &ctx->def);
    5802         if (ret) {
    5803                 ath12k_warn(ab, "failed to start vdev %i addr %pM on freq %d: %d\n",
    5804                             arvif->vdev_id, vif->addr,
    5805                             ctx->def.chan->center_freq, ret);
    5806                 goto out;
    5807         }
    5808 
--> 5809         if (arvif->vdev_type != WMI_VDEV_TYPE_MONITOR && ar->monitor_vdev_created)
                     ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
No need to check again

    5810                 ath12k_mac_monitor_start(ar);
    5811 
    5812         arvif->is_started = true;
    5813 
    5814         /* TODO: Setup ps and cts/rts protection */
    5815 
    5816 out:
    5817         mutex_unlock(&ar->conf_mutex);
    5818 
    5819         return ret;
    5820 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
