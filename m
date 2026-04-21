Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CB1F327D9
	for <ath12k@archiver.kernel.org>; Tue, 21 Apr 2026 17:37:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/2ixQXFHVUXDsGjirX+hQTMgz+71hp7/OJ5nFlg1aaY=; b=Hp5um051LFJ0RJlaYau54CWQOB
	+l8y0o1hK1sH5/gIZ7ZSk3vYZYbw3jmts/7RLWEwAsDzWNd0U1Jn2o1tTNDrLjfjSgt4XwG5xrow1
	Jezim4kkAykiqp5epdP4iQzukEp9qtqLTxkq7D/KymVU0OmjSqSERFDN/+YYTtKOHqK6FU2sg5tR1
	dKh4MaBs+9BJgKxGnCfbfXtV2djhWWf+Qm2fxNUYha/zjcOa6rpBkFmocjE4/iAPvJRH1kvDkclTX
	vhcj/c+IVTicXw3UJGmXsuOXULjY3UDqvlEtjMtg49Pqkd5Fbvqds+U4tYyqgu2shwhIIgSfmoDm3
	hV0O80mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFF2p-00000008ylu-2vxa;
	Tue, 21 Apr 2026 17:37:55 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFF2m-00000008ylb-2MJD
	for ath12k@lists.infradead.org;
	Tue, 21 Apr 2026 17:37:54 +0000
Received: by mail-pj1-x1030.google.com with SMTP id 98e67ed59e1d1-35e576110adso3076420a91.0
        for <ath12k@lists.infradead.org>; Tue, 21 Apr 2026 10:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776793071; x=1777397871; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/2ixQXFHVUXDsGjirX+hQTMgz+71hp7/OJ5nFlg1aaY=;
        b=TeBsSqLpe9/jmEqGz7GzwCRqNlMWyWd9Ck1Dj2HZnhQ+szFNMQ3/oZpzk2+kbkk2lG
         oEQevks/obSr2cGMEM8ahCJkO5TX2TSa1jOFgWF3rmJu2obWG7L2mucx6LnUHdJWS7rC
         w24SpPhiB5EYUlRIF3xX3pqX5Ppj+PWu3GPpTw0PXoVGgnk+IxTCMCRxHaRBFtU0vrLv
         sJU7YwJll931U6i4IzC28Ugjr5tmgYGDyMq9GBZFFaLr6dSfbk4hHPBzc+vrb9xQZEed
         Ty+vE5tuegVhJoJkGdFot6908G6ZFAdVGM8bKQB5/fDOAHCk5RTF8LIm2av8j09caLIE
         Zx+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776793071; x=1777397871;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/2ixQXFHVUXDsGjirX+hQTMgz+71hp7/OJ5nFlg1aaY=;
        b=V70JIaa9wHsbDA6D0McfXh9YgSVhZ46TYKtVpVA9hA14PXElRIhHksDZqKcc1Rhxxf
         JOjyeEDUuKMhLMYhbxOI1zRxSsyR/EH6+NHy0CcU8qkDjWgHg85n0xYZ4o9rj5WYN26X
         ySiEj9/5N+2ze/exLDc/lDBTxFf5YdLUSctg0ooHurMuUSwi8zeLlWqVcGWfESD8DOyK
         uhsJT7LmwaEL1Zbpp1Uf30iDcnGKsyVDYtsEGrHzzIMnDghiIjUnfrD0POkFwm5cjb49
         br6UfeZgGZ4YpVYn2RqIeEmNQmJknMGqTwJBNtemlyPOn2SbCLGlgA+/4ySytjh1QnLt
         jVtw==
X-Forwarded-Encrypted: i=1; AFNElJ8b+PbJ1kMcAICKVQ5w5hv8V2HRoMP0cCcPm83oRm4R9OR45DmOu8DDt8qu/8Np9ML+fviOV6s=@lists.infradead.org
X-Gm-Message-State: AOJu0YzglEU/xoJV/dC35Y7xrGZisJLtsfUiAhhkR7I7Zh9PKwELNLF0
	wDzsJuP+2ZSUkFayWAAiEpzh36YhiWwF8l2PbAlnmMH/TfTH2ME35TIt
X-Gm-Gg: AeBDieuQSLCbNx7RmY9zltlRIsPJ+239PFSPcTNA54DdXKHKsLu6bHEyb4voXREUjdA
	Z+6vY7Qo0TN/9Iywt9nZLvV/VCZ1OAZftkBUNAD0PbskTBa+3aq3qBAFo8G/DZXm4nSiXzp5XDf
	mbx4Vfyhn/Dp/AWcGFha9Jkq0wek+9DxRr0FimPo1gkTwmFsQaaWdVAmU/cSWrZF6EN0iqJdycj
	7XGcy9RMZcM5okrZg1utJVrTF7V2OxX3rvq9zsHQa/v3wGP9wwmFx6iiE6YaRWPDUIzKxGHYv2F
	mJ1sYPJxiKYT5EO2Ui1v9t7aIycK0ipYevS3gYKlxOsXIXxUBUvymeh6upA0opexhJBdI49bK96
	JB3YrpO9eCsZbPFbFo3FDa52IwVbUgPoM5PynA2wp0GYsrNPfsuu/zN51pmbsHszL8TdQhxCaI3
	nk1eocv8SZBTP6QNBStvTqE38GaY2Mybub8G4X10tyXFkks3c=
X-Received: by 2002:a17:90b:2e4e:b0:35e:579a:7e9a with SMTP id 98e67ed59e1d1-36140204c56mr14523734a91.7.1776793071332;
        Tue, 21 Apr 2026 10:37:51 -0700 (PDT)
Received: from lenovo.localdomain ([123.110.133.16])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm14772234a91.17.2026.04.21.10.37.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 10:37:51 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org,
	Kalle Valo <kvalo@kernel.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix false positive RCU warning on PREEMPT_RT
Date: Wed, 22 Apr 2026 01:37:42 +0800
Message-ID: <20260421173742.1066170-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
References: <20260420161049.695518-1-asas1asas200@gmail.com> <4cdf2e61-fe69-4168-9df7-55bb71585dfe@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_103752_606292_03D1605F 
X-CRM114-Status: UNSURE (   6.31  )
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Apr 21, 2026 at 10:24:36AM +0800, Baochen Qiang wrote:
> should the instance in ath12k_p2p_noa_update_vdev_iter() also need to
> be replaced?

Good catch, thanks. Sent v2 that also converts the WARN_ON() in
ath12k_p2p_noa_update_vdev_iter() to RCU_LOCKDEP_WARN().

v2: https://lore.kernel.org/ath12k/20260421172500.1050754-1-asas1asas200@gmail.com/

Thanks,
Yu-Hsiang

