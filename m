Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2686CC021AA
	for <ath12k@archiver.kernel.org>; Tue, 18 Feb 2025 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MZEcgITSiiKIsZylFwsENK2tYufFg6kig8Md0m03l0=; b=vxQrjI0f/kmYETtIwuoLPIom1S
	9HYjh+rb3tSgqkGZFY2GI+Bu5X1wLKcEEA3IjHsXCYOoPJyS6KpneMBGSAsXjZ5mEjngEobFo5dvK
	1m+1ZFmC/YiPqo9ea2qnEJePKdOd1A8qtMrPkNUDxsopFNKFLpwfsAZxJdKsydC9ZU8T21TZErJcA
	R4FMuZUudK2TP0aVuLAB0s0kkIwdSyoK2WPawhhxBTVw5Wv8oOKt9vkH8ELpe/1ZVK062WOyf3oq+
	FWlrbxoQteQGSyHgYxkFVpxxgSK4TIYnU+fPBrU5Dq7GK4S5qv+YqjWS+gXwPTbP+5HZyUjxZltj9
	PjOeGb6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpw-00000009FaI-3lxT
	for ath12k@archiver.kernel.org;
	Tue, 18 Feb 2025 17:56:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkRpQ-00000009FUB-43fA
	for ath12k@lists.infradead.org;
	Tue, 18 Feb 2025 17:56:18 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51IC3AH9003681
	for <ath12k@lists.infradead.org>; Tue, 18 Feb 2025 17:56:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5MZEcgITSiiKIsZylFwsENK2tYufFg6kig8Md0m03l0=; b=maBnwhyNo4vyavOI
	3qYJlKMw4oixT5ZXQ12wvrrJ8n48BTX4bMntxD7JOvvb3DQrVnPiuCHb5Bhskv+7
	c3QB1jED8ltc3AQeBNJagJpsLjNj9/TikfnKQVMD7Y5ZEpsIHfzezgks76us3eZ5
	vtjkZ0lfXIuPUHDpnYI/LN964F27tQzJ9XlRMgCO2wPegvmraveJR1Kg8vVMs+Rv
	Cqa4VX6HiR4vMAuHb5seMEOaBtfx5y8hpRCcN4rrFU7pxWNlBSUFHLHXrs8SviTE
	N7fR07kLTvXIyRzmLYhs2LSgpQMyIb3+0aTvhh3V6aZFE5x2nA4wYmZeF1hdZ835
	os4w9Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ut7twqtk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 18 Feb 2025 17:56:16 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2fc45101191so5990373a91.1
        for <ath12k@lists.infradead.org>; Tue, 18 Feb 2025 09:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739901374; x=1740506174;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5MZEcgITSiiKIsZylFwsENK2tYufFg6kig8Md0m03l0=;
        b=V/q0TKlFpdwCuDG3huRyz2cvpI3ZI2iSI0hnrShwB8UDJn/CSqZgBvCRySxRdM/hBU
         H3lsV5XHLvxolVOMSJcsxNJPiL9TxAMFtWkoYJjLsoko9MIARFlaAk4wc71cxl/gEPmE
         7XF0LbqUc3ng7NUj0wL9rFO6BlYIII3JUvqSRKN/t6O5EXSTO5WFiaXf0P138j7Sd2Ic
         XEGCGWDJvB52Wg8Hk1fATcMSy/I8CbtDlwXCGdZA88weCkTgVQyb3q1+mUTtUt1rj5rJ
         6vnNTpWo9Anda90ZtXSi8RjezyYjnNT/Hd8G49I4B/CW3SVjJMZlF5UQVtea3HOFNNxP
         E6mQ==
X-Forwarded-Encrypted: i=1; AJvYcCWloxGdA1qmLF19SLk1bM5Clfzbiis2fvJJbqhAZv3lUMtiRN+3K3+MKrpmy1GFgsldTDpZ4QU=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ntpmhHghqeVnHxYK2SecvzSSemCmRfeMr6guQ+23nsVGsVQR
	/49gyRDM7JOvaw1ZmfHhMLLR68cGFX3M90qkZVP5yz+p6Xk9rtX7unQrS7LaXVi5HWkuXL/u2vV
	koIdKogi9Y/wWyCzdhwOnSFf4UfDjjOmirUyp1fxwQpWKqMcC9K2C5sf5qt+eca59dHnN
X-Gm-Gg: ASbGnctn4MtT7Agc8Tetau/9nIsz9GS98kinWWHrj9M2tx7mb3If6PRC5uq6H+jPnxY
	N3/JuwIdyGYQr6Sz0NUwcWKtL0AbwRs2WhVqo2Yuz0YoTX+qqSgJUOC7+Lk5gjDaI0SxJ+u24o5
	PKvm8rg1QbGg5zxH2zVyf19ZSptutJyTamnu46Tt6A/eeaA1/BHDP5Ad+VOvDQgvXUc7FZ+6dxa
	Ld37meNCTLq3b6VwoVGSc/IFIuDW1HJG+7Je1L3uIe2rT1cqhzzcptxrYF+olbKZiXvu1syJAx5
	1u4W4csv3ju3d9FCNPkxUZHVpueC2dFgYndCzWrGbg==
X-Received: by 2002:a17:90a:ec8d:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-2fc41153decmr20652825a91.30.1739901374478;
        Tue, 18 Feb 2025 09:56:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHHRnoQUBRepGyq2OMwaJX32opGFnz5QDIQdI91vfH8K801jeMK8U9QrNGbTTdrdnvAPHaa+w==
X-Received: by 2002:a17:90a:ec8d:b0:2fc:3264:3666 with SMTP id 98e67ed59e1d1-2fc41153decmr20652787a91.30.1739901374048;
        Tue, 18 Feb 2025 09:56:14 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fbf98f698dsm12342252a91.28.2025.02.18.09.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 09:56:13 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Ethan Carter Edwards <ethan@ethancedwards.com>
Cc: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Harshitha Prem <quic_hprem@quicinc.com>,
        Kalle Valo <quic_kvalo@quicinc.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
In-Reply-To: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
References: <20250210-ath12k-uninit-v2-1-3596f28dd380@ethancedwards.com>
Subject: Re: [PATCH v2] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
Message-Id: <173990137296.1304166.12952412255986592297.b4-ty@oss.qualcomm.com>
Date: Tue, 18 Feb 2025 09:56:12 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: 11HsKCGr9wZPPYbV0V8QrvpHRduKi70o
X-Proofpoint-ORIG-GUID: 11HsKCGr9wZPPYbV0V8QrvpHRduKi70o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-18_08,2025-02-18_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 impostorscore=0
 mlxscore=0 mlxlogscore=469 clxscore=1015 phishscore=0 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502180126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_095617_124054_7807B403 
X-CRM114-Status: UNSURE (   9.26  )
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


On Mon, 10 Feb 2025 21:49:41 -0500, Ethan Carter Edwards wrote:
> There is a possibility for an uninitialized *ret* variable to be
> returned in some code paths.
> 
> This explicitly returns 0 without an error. Also removes goto that
> returned *ret* and simply returns in place.
> 
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: cleanup ath12k_mac_mlo_ready()
      commit: ceb3b35f5ef4a0c490f54eb8b53075fd83a97d11

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


