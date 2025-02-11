Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC699C021A7
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 15:45:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZHyyLdb/N+h3VnNaZZ6izwJyUd6M8qZ1jcd25f6MXT0=; b=iAQYSxj5UUmHlzArqPnFE46NWx
	RhzAnE9KOPb29o0buG8NP4eGQ8GEKZ0EE5bm5fuE/WjwFEOq1R5yEkqOU0r4SG5hIpcQb/pXI/AKu
	HdYZ+XsD2zlRsJ0oo/qL8UwHi1En6wDtNJnbsOEOdbAV4I8rzpNVO1lE7siCh2zZQO0iysnnY7vkp
	/31y5RnbYmKd1eAmP0e5u/+hRGLgAVBXMpcSNK8f0FUoa6wUyFCpeDDIkuFm7RTyx3I1psgOj5k6c
	D+Ahz/ckmHr9ht3NJ/KghLlSYH5UOVrjT9gCRriC6OdlTOt5FLMHSnjv3mGkZxm2GM7Z/A9KRrqq4
	qyyQaFtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thsSU-00000004LRf-0SjX
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 15:45:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thsRG-00000004LHr-2B0C
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 15:44:43 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51BCg0Kb030180
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZHyyLdb/N+h3VnNaZZ6izwJyUd6M8qZ1jcd25f6MXT0=; b=h96JWBLn0wOR12g4
	MpRx6TtzARJVodn5iqzXycjRC9iapIQxZWrpXu2uzg0yxH1snNzuFt89fBN4+Zun
	FlyXdq6GVwfTFbHhlQi/y+NNIR92tPIuG8oRLy9RvLfwDCh1NWaM9OC33xuYNM83
	PjQiOl9bvFyRlq/+UdRBIT147hF/MjBz9YeHk97K0plh5qv3+EujKM9VAg28QFOW
	MppYi49npDXCigQC9S8WmZ8wlcSqK2/Ietl+MYyRMOAC6za3xKWElHkBrm2c7LcH
	xKhi0PPIelouuGxot4B5hwKZrzaVmehuUwlRwfAPdylMbLml/ajkq8g5Duu+GLYd
	1eRPfA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qxg9hxd1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 15:44:41 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-21f42c8f5f6so74565275ad.3
        for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 07:44:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739288680; x=1739893480;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZHyyLdb/N+h3VnNaZZ6izwJyUd6M8qZ1jcd25f6MXT0=;
        b=TxfyrqHEsqUclkCNUGiWcTZ6VKVg6TUmzHQ2xEKVZqatQ5/33sXBfXSxCaacspIq2o
         Olbz8BfnRlhe1yW1Q/h2kLt3xXrwKfyKn388JxPJvZ31Baqi1lvAZYLDTC9GvgNm6qDp
         +yF3ZiLDPLXXAY1eTBCwZ9K8hgb/GAj8f6ryEw6Q6ubhLdS1UcSgYXbFIT8GiPONkCg3
         ojHxxOua5IN4Gpev1GE02cvzSPhEAO0IFj91bpwHE8A+O11KlYNYwRbTTNct1VbB/Lgg
         H28eEz2IxhVowlGeI6eqjXtmaJQ8dxvHWyiFyB1QRIzGQGN/k4RqZVxzFlJRuBvRzKXV
         dxQQ==
X-Gm-Message-State: AOJu0YyTCQ+AcVT6FZHCVa7wMycMjEvZ17ZBSyEn0J9CxMgSjFN2mL0V
	5U7y9u89MQfFhi7aSRye3PKQLllzdiyWjolWyljNKEnFMZr2MZYabz+4q7rzjl4cQKqK8qL7Dkq
	zFs/wxBDS/LcLJv8HQL07BqXYYysp6T9UXfQ2A9XrhRoSrGpVWLsO7m96/pD8HZ0OJha7
X-Gm-Gg: ASbGncuuHj2x2EWjy0FnBy/7M5lvN/NnhshMOhC8kHzq4Siu2nBG3IqTCbZLwi2ac70
	CAONvVn3OyTskjS5wIJH87P9JdgbKZ5zdjJERbm7OoT9WAyToVWxsK9h4z9W8I5E9mOyPv0GoiV
	wbk76rdpUCBC4GsEEnONwnJv1N7vNvwuIfSB1brRZz4fM3g2B614vjgMtCiguspqdndszo1eG/M
	wzKyWr+Cspq8n0hEGiqyxcHpMk6TkVfTS1638U/8MbKh9hHebngqmGdl8eHkLhpVOfp35kmDT6l
	4jOkp7TVD6UMY1R+rZLmC5p4ElR06sIV1dvfWcPbkA==
X-Received: by 2002:a17:902:e802:b0:215:b473:1dc9 with SMTP id d9443c01a7336-21f4e763a2fmr317952555ad.46.1739288680077;
        Tue, 11 Feb 2025 07:44:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGjNNJEEkWVLklV9ZcGz/8GNqrUxr2g46yIAz5+svU1/6BMP7z+h+lR+FWrjXqSXOlZT3KLzQ==
X-Received: by 2002:a17:902:e802:b0:215:b473:1dc9 with SMTP id d9443c01a7336-21f4e763a2fmr317952255ad.46.1739288679707;
        Tue, 11 Feb 2025 07:44:39 -0800 (PST)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36510e34sm98399365ad.28.2025.02.11.07.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 07:44:39 -0800 (PST)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
References: <20250207050327.360987-1-quic_aarasahu@quicinc.com>
Subject: Re: [PATCH 0/3] wifi: ath12k: MLO setup for single split-phy PCI
 device
Message-Id: <173928867882.1115150.740909223944281492.b4-ty@oss.qualcomm.com>
Date: Tue, 11 Feb 2025 07:44:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-ORIG-GUID: jFLf5ccW1aqMFv3p_bRB_eYhmUA1IJjH
X-Proofpoint-GUID: jFLf5ccW1aqMFv3p_bRB_eYhmUA1IJjH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_07,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 mlxscore=0 priorityscore=1501 malwarescore=0 spamscore=0 impostorscore=0
 mlxlogscore=607 lowpriorityscore=0 phishscore=0 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502110104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_074442_677646_F891D756 
X-CRM114-Status: UNSURE (   8.88  )
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


On Fri, 07 Feb 2025 10:33:24 +0530, Aaradhana Sahu wrote:
> The single split-phy PCI device can establish multi-link operation(MLO)
> within its own radios.
> 
> Therefore, enables MLO for single split-phy PCI device.
> 
> Aaradhana Sahu (3):
>   wifi: ath12k: Enable MLO setup ready and teardown commands for single
>     split-phy device
>   wifi: ath12k: Remove dependency on single_chip_mlo_support for
>     mlo_capable flag
>   wifi: ath12k: Enable MLO for single split-phy PCI device
> 
> [...]

Applied, thanks!

[1/3] wifi: ath12k: Enable MLO setup ready and teardown commands for single split-phy device
      commit: 5cec2d86c7f4242fb30a696d8e6fd48109bf3e8f
[2/3] wifi: ath12k: Remove dependency on single_chip_mlo_support for mlo_capable flag
      commit: 16266b7ad6c011f760083851e8caa0d6b657f5e8
[3/3] wifi: ath12k: Enable MLO for single split-phy PCI device
      commit: 4f4bd1f8a5c2f7b1b24ecc553033b210de2a0513

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


