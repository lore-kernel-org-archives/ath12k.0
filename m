Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DA08C636CC
	for <ath12k@archiver.kernel.org>; Thu, 16 Feb 2023 14:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MoiL+FxEztZvkhF8ObXsOq0lHF0R4PoyWWFhx4MikfE=; b=0BRXJY9hKpEcnM
	g1HSbZt75ngk+sb3nzxuV+y9d0gL/c0n6fXkVghxEeiriobsWJPxLZJnHC2C8tdB0UyCEi1Y9jaSI
	Xvo3YmmGfeNTUgKBteugoMRhqPKRpQzrIKVLLoBlkMQ7VMjTWcl+VcKblmcHFEVhKC42u6sh8KMYT
	2SszIROllSK5gWW3v0QgilWzv7MbcVn4ktMtUgFTLZpPxZUUnEi/2xQA6ghfB+eo52iUaZZqkpUUT
	2PC7SJcnV1qBqwbeGXLYv7JRBYyKcZH66XWF4Cb6+tlLYxSoNm/frfpz0YbYzQCalLQdJdZtW/vpP
	C/qlMi3ah/dOOliodIMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoY-00AU1l-LY
	for ath12k@archiver.kernel.org; Thu, 16 Feb 2023 14:00:46 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSeoW-00AU18-8y
	for ath12k@lists.infradead.org; Thu, 16 Feb 2023 14:00:45 +0000
Received: by mail-ed1-x531.google.com with SMTP id fj20so3154986edb.1
        for <ath12k@lists.infradead.org>; Thu, 16 Feb 2023 06:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vt0jIbJbRmOGby/oN8WgltcBDgruIMCpp/2egokuL5w=;
        b=Km0jYhMNtTHI51i4vdXkaSYiIRxF6mEW2+MuPx9vnT5gD4N0yQ5TYJeiBySrr3lP7K
         61vIlqnkZexVLZbo4kZ87r79ibsSEsNeWhvwQSndEbQYx+pEFSpHMeevOiNlemktUu1r
         78UrPo2E9IMwSDR6CE7CdcRT9VvU2jnj/EZFFudjYqpdRYBonPQE6BTXEdFj+TQq9PLb
         9GsvyptpH5zy1+jac3pxoJJorWhXRwUYfqDGU0Vno9JUzrklj6l8xiZ6R6dYclnpwtxj
         ns3BcnxK8S/MtUBAxM72aJR2K5bQ1slEWbMHIo9c4bkR5EL8ZM6/xtY105G4Kst/T8R0
         kkrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vt0jIbJbRmOGby/oN8WgltcBDgruIMCpp/2egokuL5w=;
        b=e5FYVimPwNMg1YihBv53uxkw7ewGAEaaZ7dc4G5kd1NyJ98lHFU6hS12ZDMwBswHAP
         XK6zkusGLedvVgPVj/corDNy6gxYC5stdQtexJouHB1f6x1KvOiXWyRl7wyFMkrjUHkB
         El2CREEsyO2UFEB5L8BKLCpdqmdGTQ61pOigIIPsju9YgiDbRRj20CcVvPHHrgLvJQoT
         WPNiKDsU6+msbGMCp62B3zrjLkO3xDrtU7WGOj1gVPZCQ5hFiC4hAGivvyHHtavHpezc
         rqXBldNTBPdcyntfp/8uqHfBz5ZDR0grSzBGvWrLmnXJoKaWQrA106MljBdmPwuDhpTo
         B/nQ==
X-Gm-Message-State: AO0yUKVFoUyTLTPXl8fDa3b6ogOhZf6j2pOx/KIOnzR0rXThhL5IiPrJ
	bHtnvBQ8ZS9Z3hArmHtkrFn4dp4bCTce3Q==
X-Google-Smtp-Source: AK7set/FvJwFTdXLsGB1itHNiMR3vevAOzVipKU0AQPOhNuvMuEoescaayT7RDeDkInM0qTMfBnCcg==
X-Received: by 2002:a05:6402:5022:b0:4ac:b528:5727 with SMTP id p34-20020a056402502200b004acb5285727mr1939843eda.1.1676556043024;
        Thu, 16 Feb 2023 06:00:43 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id s27-20020a50ab1b000000b004acb6d659eesm902514edc.52.2023.02.16.06.00.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 06:00:42 -0800 (PST)
Date: Thu, 16 Feb 2023 17:00:39 +0300
From: Dan Carpenter <error27@gmail.com>
To: quic_kvalo@quicinc.com
Cc: ath12k@lists.infradead.org
Subject: [bug report] wifi: ath12k: last element unused?
Message-ID: <Y+43B0+OUAFYeOAY@kili>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_060044_337183_F66F0AB7 
X-CRM114-Status: UNSURE (   7.79  )
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

	drivers/net/wireless/ath/ath12k/dp_rx.c:1172 ath12k_get_ppdu_user_index()
	warn: why is the last element skipped?

drivers/net/wireless/ath/ath12k/dp_rx.c
    1167 static int ath12k_get_ppdu_user_index(struct htt_ppdu_stats *ppdu_stats,
    1168                                       u16 peer_id)
    1169 {
    1170         int i;
    1171 
--> 1172         for (i = 0; i < HTT_PPDU_STATS_MAX_USERS - 1; i++) {

What's the - 1 for?  The "HTT_PPDU_STATS_MAX_USERS - 1" is done in
several places so maybe it's correct but I couldn't figure out what's
stored in the last element of the array.

    1173                 if (ppdu_stats->user_stats[i].is_valid_peer_id) {
    1174                         if (peer_id == ppdu_stats->user_stats[i].peer_id)
    1175                                 return i;
    1176                 } else {
    1177                         return i;
    1178                 }
    1179         }
    1180 
    1181         return -EINVAL;
    1182 }

regards,
dan carpenter

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
