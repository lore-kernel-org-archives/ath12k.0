Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C06D3E77183
	for <ath12k@archiver.kernel.org>; Mon, 16 Dec 2024 16:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uXK+Gh7SxfMOD309LLK2VY3VlO6Qduz2Gj/cqU4r/rU=; b=LUtNhI7W6wetC1bsUltXBkuDuY
	DxiIxKuDAkkWrzdr5jkstt5910m/iJA+3C1Fb3v0aylGzbLI96oBQfzMaDhWydcfScqU3CTGKokOV
	o7q5BDBS6FClOnnqPmFgcOX9H1d1Za/LbcJs8HzxFYkfj2NYGKohv7x+HJ5K6xkrufH5Oy71WWq+2
	e6/LXbvqJe3L33CQl7wst9+0yR46g3uTu3LmWdcVBEKyD1fv9jK7ehTDMX/1aJJ87cG6EA0H48dob
	b2mSa45uiHR3963y2wsMkGYQg2lqhn7xKURtduvBHsuo6FTtvLjx068sGbFksb8SL36e3vxH7Bzcg
	dT9Ra4oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJM-0000000AfTP-2FtQ
	for ath12k@archiver.kernel.org;
	Mon, 16 Dec 2024 16:51:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNEJD-0000000AfNy-3kth
	for ath12k@lists.infradead.org;
	Mon, 16 Dec 2024 16:51:08 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BG8USpf022398
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	uXK+Gh7SxfMOD309LLK2VY3VlO6Qduz2Gj/cqU4r/rU=; b=VW8FZkdu5JETdDC5
	5Lrd5su2M4s2Z/EtMzz5cFnJfodVoZ/zS1sM/NLTiFJoifWVJxCK/pwD/eL3CBts
	nuTbSzSo00AhnMrKZm2FIhlN0UzL3j5L91UD4+i95943xAu3R34L5/I45DNfzO8Z
	8b/gKf9yO1LU0b78s7F5oErDyuW++zKTIBZ4M9jjwTyXuAv1Vxyi0fPYE9oBEIws
	cjFb4Al6LvvXTt6mrxZuEfaizLUN5OJ02WQvIxvLBIypFip5cnATR4eD9lwSmiuS
	IPTOvKnlmdJt/Zwb+YlIOGrbUpKEkEkGIrOVOKZmGmxHruX3MberACisQOoQQr6S
	NIa0JA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43jgrr9cam-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 16:51:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-725e8775611so3669124b3a.1
        for <ath12k@lists.infradead.org>; Mon, 16 Dec 2024 08:51:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734367861; x=1734972661;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uXK+Gh7SxfMOD309LLK2VY3VlO6Qduz2Gj/cqU4r/rU=;
        b=R5CVlTuvIZCWZ273Us+zogMvDnXpltobKjy7NuK+0hf85lV7Wal6DWnb1qyjj1Bz1G
         8my3F1u3VgEgWJnGjDZhMewSHqlPNpo4YmsLmWq4/L0s7IPDLrpr2rIrXEEx69Jh1TF9
         E9JjLDje3ed37U/TRj+hNskyb6+OvuHPZZxs+jRRjxqqhnNQyJoZ8uCC826tnLJl8xKx
         oZjNKq55N4RvExE2FeI0lTCF5ezZjkgC6Zn+ZeDeg8hEe56qCUzhHHeczZejyk9REG6i
         MqXx3r+B0r7nRAUo3qjoioH/nLERWIFGHaYJrWg/BnFMPHC4NqzpnVNePQSPsQcbGsN7
         lxAA==
X-Gm-Message-State: AOJu0Yy2O3UTnSQduEl/TrsD7EpNHl4f5GRUMzKchuVwclJLL+FD/n6t
	0FjJJqqZ5piC5wGt4E44p7RaDehXk+/64nYKfCoLrRe9TDU0VqRHeDaPxj3KNQQAZghgOmmN5lZ
	zc8bWNnh08G+Id7/cgg6VbFrq9DLjsiZpjwR26XPhi8tL8ctKQuH+qdDnkkHjzYuHMf+4
X-Gm-Gg: ASbGncsTzVBdlEIgtg2DQvyHikYlu0PR0zODcj6H2QBKQzsHN6LfKregxqtzYr8FZSC
	J2VMoE90WwgbH+Ybbn5w7hJAtllWaKveMiJTcaL0/SNypfZmD3iKY+uT96pKNtTnISGvLtcr/cL
	TXgeerEEhMpZkKnT7fUfvujoCMWwtTfJ5umSJ+RmywTDnOlfr5eOwq2S/9zQhJ6HatqsN4AF43m
	IG9qh4wgTwzfled5dNLLmr3iCIBo1eAGPlxRh92Bzt8KbO3hLwSHqTxNlSBbiP4jnNKvoyVkLhs
	BDIhfxR4LYWECnT9pw==
X-Received: by 2002:a05:6a00:2e28:b0:728:927b:7de2 with SMTP id d2e1a72fcca58-7290c138279mr22515202b3a.8.1734367861369;
        Mon, 16 Dec 2024 08:51:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGyXq+qauS5YjUavPseBZr2ZSchdvJvDLJVQPOOqYKIf8/TvfD82mWWIHgbs18NZ+XCQh4yMA==
X-Received: by 2002:a05:6a00:2e28:b0:728:927b:7de2 with SMTP id d2e1a72fcca58-7290c138279mr22515165b3a.8.1734367860962;
        Mon, 16 Dec 2024 08:51:00 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918bcde43sm4937486b3a.194.2024.12.16.08.51.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 08:51:00 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20241211154358.776279-1-kvalo@kernel.org>
References: <20241211154358.776279-1-kvalo@kernel.org>
Subject: Re: [PATCH 0/7] wifi: ath12k: MLO support part 9/9
Message-Id: <173436786045.3413746.17890152518880162351.b4-ty@oss.qualcomm.com>
Date: Mon, 16 Dec 2024 08:51:00 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: Xp1Jg6Tbk2EnELeZKA9U2o2XvevAsNHe
X-Proofpoint-GUID: Xp1Jg6Tbk2EnELeZKA9U2o2XvevAsNHe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 adultscore=0 spamscore=0 mlxscore=0
 mlxlogscore=911 clxscore=1015 priorityscore=1501 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412160140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_085103_952913_080E64EB 
X-CRM114-Status: UNSURE (   9.38  )
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


On Wed, 11 Dec 2024 17:43:51 +0200, Kalle Valo wrote:
> The last patchset enabling MLO support in ath12k (only for QCN9274, for now).
> All are small patches adding the last minor features before we can enable MLO.
> 
> Please review.
> 
> Kalle
> 
> [...]

Applied, thanks!

[1/7] wifi: ath12k: symmetrize scan vdev creation and deletion during HW scan
      commit: 70f04d72fddfb86678b9786cb8427c1ceda351fb
[2/7] wifi: ath12k: add can_activate_links mac operation
      commit: 0f0a74bd44cb9e3507e357f0291a1acaa9c7fc68
[3/7] wifi: ath12k: add no-op without debug print in WMI Rx event
      commit: 08bcaa2ed6ba007a2ae6d1a1a2ca9d7e84e2f3ee
[4/7] wifi: ath12k: remove warning print in htt mlo offset event message
      commit: 288deb2f062409dc0586e693a378666a4812c7d7
[5/7] wifi: ath12k: add ATH12K_FW_FEATURE_MLO capability firmware feature
      commit: 13199dc5bc9da3dad796a215bdb2bb081de5b647
[6/7] wifi: ath12k: assign unique hardware link IDs during QMI host cap
      commit: 1c9877c9ff8c508fb80e49e63a5675e0b86d74da
[7/7] wifi: ath12k: advertise MLO support and capabilities
      commit: 37db0f45530292d5982368678241eb83f1a9bb83

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


