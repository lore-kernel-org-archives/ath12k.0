Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B846C369A1
	for <ath12k@archiver.kernel.org>; Sat, 12 Apr 2025 04:24:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/rfn9ekfwgKGh52fBrF3Oxr8p4f+ryb0UbLPbGsRYk=; b=KoEpLu+LZJsryZLMbZ/nLt6uiX
	4jzV/hRxoYHqrGSbzqmp+2B096X/Y9o+L705FUf1IwiHoXj6L8EG1aqjT5JcW2JTJleAtMqFjF4VH
	/nPYYa2eFGeNbld5A9z1ej9M4LoCLX07fNqPQ1E/KGsg2F9gtlV4SJ11/QmKBxgPFWlBHFsYs0ap3
	JWyTR4A5/DMf2A+qycbeuYc3oxo7MP3kUkpm9NuPVH+KyrdQ00vTwXDbYcJMfuxe++jcLm9HWfls3
	U0crgXHDVp//WXpYwATV7ioHFAR6ZzyHL9YPQHOAJhnTJVpI/4/nSf2HEbJb00yZqLOyMtjMgF82a
	bAFJkMSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPf-0000000FPNC-3ZxX
	for ath12k@archiver.kernel.org;
	Sat, 12 Apr 2025 04:24:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3SPb-0000000FPKI-3hxw
	for ath12k@lists.infradead.org;
	Sat, 12 Apr 2025 04:24:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53C3eedg010654
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/rfn9ekfwgKGh52fBrF3Oxr8p4f+ryb0UbLPbGsRYk=; b=iHJPmGwvuZq0O++h
	00/FrVqsLdvLI9UDMlQx50Q/LtV4/4xiqDGsx6VqwS6nDSwNzXQ0knTKU4qMRTq6
	7A32jjpd1WSkmeyfH5ywETEzhx9Is6R5tTIErV9jIIim66wWUUFYIFzRtVg5Tpb5
	RNYpEK9Y+1qBiVEmN2RfOUOd2Ee7O4mYgQCre8E2zyIndZUMc1+t1Dn+NwxBrIrW
	QcjM3fX0aE8WYn9ITQZWCJWHEKDrDQ/ACI4zUIb6iqsBQ/di1qXpN2f7cLOEbll4
	b/LBI/UIfq+E072kfDCEcmpj4iNlcx7Z6uGlcrOpZz3/xeWRAJcjOS8G8nssSAOF
	Hs//jw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs103hh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 12 Apr 2025 04:24:10 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-af5a8c67707so1688514a12.1
        for <ath12k@lists.infradead.org>; Fri, 11 Apr 2025 21:24:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744431849; x=1745036649;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v/rfn9ekfwgKGh52fBrF3Oxr8p4f+ryb0UbLPbGsRYk=;
        b=im1Vv2OgQ/eIpU28hO9U1KkUezaIKZ7cJRDKVgwcU8Ao3sZz+SNzOjjXSciYuytJe0
         j80AN2/T97yhzbfRyihcf8C2NkilcMy/vl8fQHL5P1NIG/hzBfwlNZTPaoEM6AjB0sxs
         sor2pj73Vz9qdyUe8lVM2KE5kD5qr8bC2HOohgZKSxbWG4nQlwOgunR7AP/OH8Tyil5R
         lUGEEE7tU1xJ8kzd00qFMXnFDnDktpRHOXuZAi4sDpYzRRl20X/ruwvlKXmxTwXaxb6E
         +1CZvCfOVqB8VG/jW9ec+tmeWS0sx8HJzVn6ohG5g/fLOoPwOJk76WZiq374qHXN2q9o
         vx0g==
X-Gm-Message-State: AOJu0Yw2ZEmSwkdhhcUQfc/z8rL/NaLtQYRJjpqwPYyr97KzILWHAC+t
	YxLjsEdZkV8YnV0Mz944cvBnma4fqQDKtFaEc4bVkNx2eL2Amc1AbpKNi1sqScQhManh7N8NEQI
	xSNooBCb04XhLM6lsTcmar7qgow6O8pJ8UvPOblk2VyPKuhKkxckpW8MnSjDx
X-Gm-Gg: ASbGnctsY5ytrAkfkk80T9HH9wz06C1kypQe2KBWVC8di9eY3IKD+vnmpLkqOYMsl0j
	afFWV5mC0DDXJPM074Q6omidlYbFSLI+FyVpUrY/ulIFKN0+QgkUGbwtw5y5g6aBLWwy7DubCzt
	vFbjlkhSK1gIVRKagxfHtQH43SynN4dfooyZQIFvlKRVUhreaf2Pwl/wLWQikNOic4PDxJNwneP
	TDe9oQ1hdLuQEdKDV111HrgXZSibM/C1Ydncv3U07yJRwjRNSXERNGf/urzFM3uS8fS5o4XpZua
	qaRTLm4zhlUYEF2meCrxHk3lBCki28k760ZFXdtxoIy2NMjs
X-Received: by 2002:a17:90b:2891:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-308237ce138mr4115138a91.30.1744431848915;
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmni2XqUHIuZE1euURYN7ChvjsmXunDXEvq3EGa3TLtkCH5qTOkMC0aAyDH4+SZl2XFryD/g==
X-Received: by 2002:a17:90b:2891:b0:2ee:db8a:2a01 with SMTP id 98e67ed59e1d1-308237ce138mr4115116a91.30.1744431848357;
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-306dd11e643sm6829912a91.12.2025.04.11.21.24.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 21:24:08 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Balamurugan Mahalingam <quic_bmahalin@quicinc.com>
Cc: linux-wireless@vger.kernel.org, quic_tamizhr@quicinc.com
In-Reply-To: <20250409155125.299380-1-quic_bmahalin@quicinc.com>
References: <20250409155125.299380-1-quic_bmahalin@quicinc.com>
Subject: Re: [PATCH v5] wifi: ath12k: Add support for link specific
 datapath stats
Message-Id: <174443184775.2972989.12552157443068329214.b4-ty@oss.qualcomm.com>
Date: Fri, 11 Apr 2025 21:24:07 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67f9eaea cx=c_pps a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gwDi3P6tQxOowQPbMfsA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: IGwDIkquEnfUlIsYkpt6-dcgdGBGOwmP
X-Proofpoint-ORIG-GUID: IGwDIkquEnfUlIsYkpt6-dcgdGBGOwmP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-12_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=892 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504120029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_212412_045727_113CE03B 
X-CRM114-Status: UNSURE (   9.34  )
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


On Wed, 09 Apr 2025 08:51:25 -0700, Balamurugan Mahalingam wrote:
> Add support to record the number of frames enqueued, hardware
> descriptor type, encapsulation/encryption types used, frames
> dropped and completed. This is useful for understanding the
> datapath performance and tune the peak throughput.
> 
> The link specific stats can be viewed through the below debugfs file
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Add support for link specific datapath stats
      commit: 5e0097514dfb923d27a49bd8900a649d3a50dc4b

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


