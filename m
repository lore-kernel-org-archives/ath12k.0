Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8109EFA1FDE
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 18:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fvJb0BsWSnyMQEp11ZDn/hO/2BNVrzmyvEY81XwYvWc=; b=IrH5uMG8bnUlceQ7H4SpwgeZu5
	/gtx+/vLnLBtzS2MpbnURQfg43+p4kUbybcvQvR1BWzQXd+1ZsQHopaGFef4aReXc5eb39GfirUew
	ymNLsfbO3c4ALUpiJ2DNCdJiSIgAGIQIRWt3eOBtKQCt3hvF2DeukIrI4u4Tecx2LhuoKetjiCciO
	6H7MTi9xupLm9KgzJ5YkJZPEJnNiqcyHpRFeWbU4l59UrW2rf/JL11nfDKyeWMaTsFRbd7MABB9sG
	RpKAiAFUJqVIc+RkbwQwJ5RiCeci4ycdh+ZTqjRDpPsxvERDdop7iJF6ItAxXcxOCZO0WGI/JZUGI
	klVDBVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc4Q-0000000Ac8T-19YK;
	Wed, 22 Apr 2026 18:13:06 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFc4K-0000000Ac7k-32Gk
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 18:13:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ab46931cf1so47811525ad.0
        for <ath12k@lists.infradead.org>; Wed, 22 Apr 2026 11:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776881580; x=1777486380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fvJb0BsWSnyMQEp11ZDn/hO/2BNVrzmyvEY81XwYvWc=;
        b=DWQnDN44RxDVQhGG0GdmSc++54EZSuIONP9Au5p1LPH4MlIh8Rndjd/Y3Mzg9CnPDV
         lbP1bE0N0RdzabZV90jWQoAHGZqimsjZHf78xb2Y2bFxNEYBwOeSnJkET92FKMtn9wwE
         iD1tpf6fcaAUgR0oGBNu7mDggkdsVyBEE0wENIwtf2dgYuJmdLjWGgzIvCZV1TiCkf/4
         /Ne98yaG3VSHYSwxRFopotZGYOGnc6iMUpLeYp/uNzPNKtoG5jTYAixwdfc/Itb42z85
         9RTNOB1XcAYN1FFIwt5CN/2+6tmvvMVCdJJ95fCo5OV2JkqMBrnVTFCnR/PuH/HXz24h
         9GvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776881580; x=1777486380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fvJb0BsWSnyMQEp11ZDn/hO/2BNVrzmyvEY81XwYvWc=;
        b=LqjQmR8zlQaANQOOM1HVAUVPK1Ii+g6wDLTNL+80OrQU/N9n88v1thI1Jg7rcH+K75
         IAjP6NcwR3sBF4CSu35jjUGtEiAIKTrVD5M7kKEQHs6sB+E7uTmy1ocNheKprM6jWPJs
         h02mIER3tcAiv7V0QuzUkdAl5Spujsx4dU8DHJcGHAIiesanhaWUDRX+bb5Z5+IdaPNY
         coRAfbCQbO5BPz5CZvzLv/5waMuf93WHahzAStqIpIgitJBkEkqR02P46dXrHXfKxPFE
         CmDXAYkzhSYWooO6OUFJpDfOd1Pm0att1gm/JI/ZWrI+9bl6cYPV4XgNWIwdEm/v5myE
         TPQw==
X-Forwarded-Encrypted: i=1; AFNElJ8l0f3N7NH9YtNUhaFpL0nyu7Bgn7gwAQGejOZCfZ/8aUQeRWdqs7TaaDLsG1MmJfT7Pb6HhOI=@lists.infradead.org
X-Gm-Message-State: AOJu0YxUY7qwGhfRB9l64g1il29rR/IQejHyTbHl0ngrUkopeZH6+m5f
	aVG0/+0myZp8nFJq5ElVu61dBn5z5VGAdS07WGxdf/oMoHwk0989W4SQ
X-Gm-Gg: AeBDietyp6itcNLx2jf0Zs0//N72/o5eqjDiv6jSdtue1YXUE3CDKTDrOHNKg3cjq0t
	DyLhj0gbmYNKi+Vf5DvJ2kaBxCR7j/5o3G8KuuWEGsUvlcWQ8wCOUXFScRaDM3IJpptJZsc/g5X
	bzCUXwJRLKbgs6IZrCorREkhJN1AWDNTANwELGjQNXaZ+dcWbCGirzh4fITA2/GqJKagzGR1eUE
	UTN9P5rYvBYP7HZDMJkp28Q/PWU8r1U81XONaPFifmtsev6p/4gtlBntUXchzFeeUm0xlB9nhQF
	jYcdNIK+ZCA7j09GPupP5GZ4cZ3PTFU9OQnd0/n6Ff2JfN1K1NELio/4hVzUR9JXLPudrODdbD6
	YyB5E3Kt4AgI/zWixXnsqgCAOWJvyetJGPOBYQ/Apl0+VBOiPZeBTk/gqQKOI/gfMEGpcO9YCvT
	OQqK8i2wwLZblV3zsLgyZUV0TrUWaf70rcxgcvksKl6bRkmdxFa68jCN3MgYLzfuOFjGq0WHV1z
	oVRnQ==
X-Received: by 2002:a17:902:e748:b0:2b4:5d0c:7a85 with SMTP id d9443c01a7336-2b5f9dbcd42mr221249815ad.3.1776881579714;
        Wed, 22 Apr 2026 11:12:59 -0700 (PDT)
Received: from lenovo.localdomain (211-23-53-87.hinet-ip.hinet.net. [211.23.53.87])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff713sm173734745ad.5.2026.04.22.11.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 11:12:59 -0700 (PDT)
From: Yu-Hsiang Tseng <asas1asas200@gmail.com>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	ath12k@lists.infradead.org,
	Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	Kalle Valo <kvalo@kernel.org>,
	Clark Williams <clrkwllms@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v2] wifi: ath12k: fix false positive RCU warnings on PREEMPT_RT
Date: Thu, 23 Apr 2026 02:12:46 +0800
Message-ID: <20260422181246.1944073-1-asas1asas200@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422142325.Glnd_2Zc@linutronix.de>
References: <20260422142325.Glnd_2Zc@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_111300_762848_68BC2AF9 
X-CRM114-Status: UNSURE (   8.13  )
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

On Wed, Apr 22, 2026 at 04:23:25PM +0200, Sebastian Andrzej Siewior wrote:
> As elaborated above, this is not PREEMPT_RT specific but preemptible
> TREE RCU.

You're right. Sent v3 that clarifies the scope (preemptible RCU in
general, not only PREEMPT_RT).

> If both this then use this then I guess something like
>     lockdep_assert_in_rcu_read_lock()
> is what you look for.

Adopted in v3 - thanks for the pointer, it reads much cleaner than
RCU_LOCKDEP_WARN().

v3: https://lore.kernel.org/ath12k/20260422180814.1938317-1-asas1asas200@gmail.com/

Thanks,
Yu-Hsiang

