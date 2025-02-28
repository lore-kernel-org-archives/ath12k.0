Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BD4C282D2
	for <ath12k@archiver.kernel.org>; Fri, 28 Feb 2025 20:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=; b=BP+oW1wsJPK+QSNHb/eFVoifhy
	i+BZh4GMMP8m75y7skQ1wTyEVbYl3cz6h0zQlbV/6TDog7dbWBSxQoI04rq0yF5gF5EFfGIJaDPbm
	KjjvUOP9BqOUHe9Ka2jfMaKULs9UzoB3jyPQHD+cYLL0hPkcrZXeFW8nBfP6BmzH3uRcPnaCT+6Hw
	NItdlo8WJkl6Bvknu6DOHvNnvEAd0CRIY37koaBuHgYjXX5hQVJHGEzmsolWwJGoWCRAlb7ZAAK6k
	7UANsXkhGMATbYbjlvk5Y8iFZiCnsX5qq8c3DLue+USTSOoGRqC3GG45oGuiX9pUIpn64kz6Bc12Z
	p5/PtqVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to6de-0000000CUvU-0Z4t
	for ath12k@archiver.kernel.org;
	Fri, 28 Feb 2025 20:07:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to6Tb-0000000CRrK-1xs6
	for ath12k@lists.infradead.org;
	Fri, 28 Feb 2025 19:56:53 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51SAXDZZ001790
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=; b=FvRbA7w7sNyDRhO0
	7mUYDTikpS+u+SGRNckdjLEmPGLTxCtQzAlViVCUMrSpU/VgFXyrvD/X29kL4u0I
	RjdXP9cSYsEzyazamLqG9IXfE7oRHn3L9Ejv5HhAE87lEivc5c1I+hRIYrlAxW9J
	Iubu6aEqu1LX7nSecbh/ESzV13lTfjebZEt+W0oF1TRFLGEDf2gTvXqGqVB2rjAc
	/cVIcXnZUU5dPXpkeIOuBr7pxy+VvkfMQtU4wt+P0J3GCvkJ/CbwkYnLdmflQ+Fo
	PXlo87oJ3XMSuz5iUVgMaH/dlnvZ4Zj36XQg4ZnjJqeb2NGXfmokIdXn//x+tQrv
	s/3w4w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 452ynwud08-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 19:56:50 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223725a1e76so14052725ad.0
        for <ath12k@lists.infradead.org>; Fri, 28 Feb 2025 11:56:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740772608; x=1741377408;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FLhrDFLiXAfPmYZ+M1E3Tzf5C/xkASQqa32SzWbQuvk=;
        b=oQhtvTmtQ0kgccPjr4QaXIyRT4OCQjkEbEk4sMB+QNI5wLTFyTxUi+PmeeIxyvXvqG
         R33VwzrQkwJTBiwjsac1bSkjGMO/Cik21Q1FUlw6HpPJxCTry8/0GNHSLf+glFRK9Hpy
         CuDJ3LmOfOZ9D10XkK7koma6y3e75S/6uAviGUw40ne9I0Cay5sq7kglbqwCFMVdvmcs
         aFFdysD5tBGefIJmwuKJ8JWoac/fvqUsQTA3r0+Vsk+WaiKJKEoBaqpo9nBskCW4L/mk
         bm0i3+vJJN7fHXo0LIj7rlrFxof5ZHtgFMEJ2leEJRJ7jgBgICTgmzR4BCQAsn25ig0P
         DQJg==
X-Forwarded-Encrypted: i=1; AJvYcCUnkK3CRp6Z1VikxvcYzh1iIZj3BnSqN5OMoLaSC8AOqG6TmrTrtcfpVc/nPu4gfn62ZRKmqBo=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzr2GV3ZElhGc5bnXD1IMmWUkp580Zub5FW08iZH2lfRsP+/26V
	KiV0WRAIsUnP3Jm08JvX85xd1uq6CWysqzHkcpf7XLrJpdmP0TCZnxi40CsyJTrCRBjKUoj/ue6
	Sj4JpqJqQfXLbO3JaBu6HbITjlXo1erDdE0z1QJSHckz8hpU/lr2ZCf/wDnbA
X-Gm-Gg: ASbGncsnA+E8s2gJLWyV4q48FZPK5hG29V2HNTvKEB954a12oZTy/E5OLzjHna0b+tp
	RoIRC4reprU5KnIza33tpKLpO66+rmCOpBUahP/v5W0WNzuHYEgTBFCPhWeniDn7K6YlDM7+dta
	alXw+hl/ABOEfn2DobHHaTh+JnPp1n2tejI7U46EBpkQ6JNTRKQUzCgRJeM7OTVZcXirLFFQ10i
	lH0JuBDVHihTNslIxRHteeARLN1kfnVI6bJXf1a266oOrePI6sQRwqpeB93i+UeJu7K6NxeCcxZ
	8bwe/U7w89WXaIJRUQvNBHPm2YyVnGwgBpaT4iIsb7Dbz/Vcjhq5
X-Received: by 2002:a17:902:ea06:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-223690e1355mr73911125ad.23.1740772607649;
        Fri, 28 Feb 2025 11:56:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH7N0OvSFFa3UWHRhgJnMWCvMyrdXk76Vy99PtpyeYMuduZgzrvVi7czXX9W/MtAa4KhsBhtg==
X-Received: by 2002:a17:902:ea06:b0:21a:8300:b9d5 with SMTP id d9443c01a7336-223690e1355mr73910685ad.23.1740772607194;
        Fri, 28 Feb 2025 11:56:47 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223505336ecsm37140165ad.244.2025.02.28.11.56.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 11:56:46 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath10k@lists.infradead.org, linux-kernel@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
In-Reply-To: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
References: <20250225-b-wifi-qcom-calibration-variant-v1-0-3b2aa3f89c53@linaro.org>
Subject: Re: [PATCH 0/5] wifi: ath10k/ath11k/ath12k: Strip device prefix
 from calibration properties
Message-Id: <174077260613.4132177.11023317176929798759.b4-ty@oss.qualcomm.com>
Date: Fri, 28 Feb 2025 11:56:46 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: 3bas2PazzFaRekXMLyVII4N1uIdve-NO
X-Proofpoint-GUID: 3bas2PazzFaRekXMLyVII4N1uIdve-NO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-28_06,2025-02-28_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 malwarescore=0 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 mlxlogscore=782 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502280144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_115651_621328_15A1FC42 
X-CRM114-Status: GOOD (  10.25  )
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


On Tue, 25 Feb 2025 10:05:31 +0100, Krzysztof Kozlowski wrote:
> Devicetree properties describing exactly the same thing should be
> reusable between device bindings.  All Qualcomm Atheros WiFi chips needs
> certain calibration data, so properties should not be prefixed with
> device family (ath10k).
> 
> Deprecate qcom,ath10k-calibration-variant and alike, so we gradually
> switch to a common property.  This will also allow moving these
> properties to common schema, if desired.
> 
> [...]

Applied, thanks!

[1/5] dt-bindings: wireless: ath10k: Strip ath10k prefix from calibration properties
      commit: fcd37e2a33167cf6b507256365e45a43009d74eb
[2/5] dt-bindings: wireless: ath11k: Strip ath11k prefix from calibration property
      commit: 352e8c4379fa540747cbb6c94c4b149c7487feac
[3/5] dt-bindings: wireless: ath12k: Strip ath12k prefix from calibration property
      commit: 64e37c19383f840da534449b88d7adea4c69f52d
[4/5] wifi: ath10k: Deprecate qcom,ath10k-calibration-variant properties
      commit: a97ed4ecb797a69f52f66445ebca538c93462ba4
[5/5] wifi: ath11k: Deprecate qcom,ath11k-calibration-variant properties
      commit: 1bd9ffec4cdb9a1f09bbba16bba538f6c58a397b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


