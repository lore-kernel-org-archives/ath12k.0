Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1120EC02193
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 22:49:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zs46lDnx0AskK+LgAT1HOzws7jDPBNJqaxXTfQlukd8=; b=fFRqwZiJDz1QvUnNbMf4hTHV4Q
	Cf5uPrSkuqoefv5V77pr4+7luwhpO+qA4ov6EzU8XlUdTBsZEyaZlcI5PXyaBm5sXriNKNRyxjIvu
	m92vJpd5RVRb4UC2C76bqpMNOwZ5nyqfkiCUkAfMlYYh/ShLt/ussNGYEhMbjSD9Hf3evAZctGSqe
	j62jm1jsevN2M3tHq98VTjYFVaITFqpZM5frC6Hdm6GTBS07DPXgaljC5SxPA+VwFHL+WK1gHlWXB
	lPE6SylRk/dfb0ymK8WEPExeyBJ0jJp2rQmMKB2KRvAXuc548H8Bo0bylvC7a+JewHag1XyzEnDNY
	ostw21Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Fh-0000000GpE6-3RQ1
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 22:49:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf5Ff-0000000GpDN-3pi4
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 22:49:13 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513IbbpM013241
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 22:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Zs46lDnx0AskK+LgAT1HOzws7jDPBNJqaxXTfQlukd8=; b=SNEyuXogHMjqff1m
	kzB+5Po8siA1LnA1jY0IMQ8y9sozcbhMhbIaS9atqZwLUiWT/OIVCC7uHHDRT07Z
	0eqZsjq5VD7abvJSH8cLSZvXhQ6rnV2RlXUXdOes9yOwE5pIleeKh6jggUHaJgfo
	S5dgUP5F80x/0lUx2hUFxkGB1FDIzj4Kione5GoYI5lYMnYoFNJECaegzv29LPrb
	KPqhkxXG+DHUe/3r1MQzsaA7CPRrM2glCA8EWJyYRYYeiko5D3DRkbFJeDJph259
	WcOWrz3q7qw/bMgdxsGDfYkzZr/HnoB+m5LtJJX8XOPJ4BApL8oqasLELAF3D4+5
	2/X+EA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44k3890fjm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 22:49:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-21effc75088so4839425ad.2
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:49:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738622951; x=1739227751;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zs46lDnx0AskK+LgAT1HOzws7jDPBNJqaxXTfQlukd8=;
        b=rzTLmRu6/ldTelz44iQS4ltYSyidu1bxVGTPPcel7rsXVLAlP+jm6qQGe5EJD+iR3k
         SKd0UTqy6Dbc7+EbZBJRRekrKbEp81nMgMOQdsvLouYR23VOl4STVIjRxaeJ7fHYKDnd
         k7FAmYzLqBXCZQK5aSCQw6TznMMuJ3Ri+seM1xdMxTLjYbmVSRjsAAi5lq4lVNnLYTYK
         YVewkfzuja6Z1se3jNvH/MfOEFyAUj7ZtX0nvICClucV6KpConDNG9PwdVxsWYZHO0WT
         D4imqSGcGbYTJwuInZH5xpAJRXQxUdMkycloyWTin0tvA/xSOY660lqZ9bKZpuyztm02
         D4gg==
X-Gm-Message-State: AOJu0Yz3XOegsfJXF4qnebkVZ6rvP/hOtNgygh9aTb0kWC/FFveBJNtE
	gOh4P5Ku16ish9A0fQHk/dZRLwA9vW849osqkGAl9ZTui18P7aDMMBByYwvoqmhOFpvcPEC0OJE
	STQMB5rcfinAVk+PMV1G3TanH7U+WwwiN9k8H5SMKEydqbjCSSdmq/+Hucu6R
X-Gm-Gg: ASbGnctTYjmVwiys+1/xtIEwuWTSlNPrn2Ub3fL03tePQoqwJxiZxejSU5vpHZ1Gtxe
	2sf9e3PpiVquZLaMGVkwNYZjFHq9qPMnDYbIxjd/Z9RhQe5iay61gNXob+y7pOn0+mNzDxFWb6i
	SYZrAnZxsiRNd6Lsm2HbxY+MeqRkwoawkZKMUxliHozqSwQ8ZoD6Yp7oAMv+nVRUzgJXEek8SIT
	GPHaMG0lRY8KHjECdyW/PS2qRz7KaH0VKpxmzadJ4xQLp2vZPhLvl+i3f5jcO1KG7fqSVKBiNkt
	5I3xO3F8iAU6bgTlPAXwr0FOFieMAQvhkP6auuBHew==
X-Received: by 2002:a05:6a20:7f84:b0:1ed:5247:f385 with SMTP id adf61e73a8af0-1ed7a6e0689mr36660687637.38.1738622950640;
        Mon, 03 Feb 2025 14:49:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHC97hIQCqs8sdJrtpJRKztQccJENt7nwzepk/QMjp93S28C7v+Oy0qD19VBoZDEZpUcJSr6Q==
X-Received: by 2002:a05:6a20:7f84:b0:1ed:5247:f385 with SMTP id adf61e73a8af0-1ed7a6e0689mr36660645637.38.1738622950114;
        Mon, 03 Feb 2025 14:49:10 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69ba353sm8887444b3a.112.2025.02.03.14.49.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 14:49:09 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Avula Sri Charan <quic_asrichar@quicinc.com>
In-Reply-To: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
References: <20250124090058.3194299-1-quic_tamizhr@quicinc.com>
Subject: Re: [PATCHv2] wifi: ath12k: Avoid napi_sync before napi_enable
Message-Id: <173862294944.3734728.9309905197333089194.b4-ty@oss.qualcomm.com>
Date: Mon, 03 Feb 2025 14:49:09 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: oUvLKKk_8xNzByKKuWPtUx1TrKNzkh0l
X-Proofpoint-GUID: oUvLKKk_8xNzByKKuWPtUx1TrKNzkh0l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_09,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 spamscore=0
 mlxlogscore=953 adultscore=0 priorityscore=1501 bulkscore=0 suspectscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 clxscore=1015 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502030166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_144911_959839_FF4E5747 
X-CRM114-Status: UNSURE (   8.96  )
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


On Fri, 24 Jan 2025 14:30:58 +0530, Tamizh Chelvam Raja wrote:
> In case of MHI error a reset work will be queued
> which will try napi_disable after napi_synchronize.
> 
> As the napi will be only enabled after qmi_firmware_ready
> event trying napi_synchronize before napi_enable will
> result in indefinite sleep in case of a firmware crash
> in QMI init sequence.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Avoid napi_sync before napi_enable
      commit: 268c73d470a5790a492a2fc2ded084b909d144f3

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


