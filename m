Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC966C02198
	for <ath12k@archiver.kernel.org>; Tue, 11 Feb 2025 01:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yL4f5n5ALnjcTNjuUgDIrXNo7uRjI8rEH+kWaI5WpEg=; b=NNivp8XSL5WbeI4z1fxoCjZaxO
	+wleBEEal/58RM2LGF8SnFrLmt7NOYWgfOUxOb3HoTlsfC18R88mMXMgzY6+Rb0+mcBskRERVL+ld
	fN54tiIb99+5s7NzXXBnIGIHaTQ0oj4CAOqRpPKwUW/6+MtPLhwX/xeJBO2f8b2emYr28HjXENY86
	R/sAj5VpkIbGKwKyQ83WdJHxJXhX2++IaXTbCqlYwWlARG7a5xNdSeq6cnHCV2G6m1MJHOftJ4qRz
	SzVjI9Qp8uXVJPiX4OfLxYW2n48SYNytF/CTYLTuxPdnU/xZIFwKTdpvAhKFsbj0hsQZOBHY4oVPk
	0A8lMyWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thenl-000000024wU-2Aqr
	for ath12k@archiver.kernel.org;
	Tue, 11 Feb 2025 01:11:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1theni-000000024vs-2Dmc
	for ath12k@lists.infradead.org;
	Tue, 11 Feb 2025 01:11:00 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AK39NS018199
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 01:10:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yL4f5n5ALnjcTNjuUgDIrXNo7uRjI8rEH+kWaI5WpEg=; b=H57qFGMTuRyHz363
	M8U0/E0M+Vs06tQCrzs4V8IMr52xvJlOcvEomWcVaE/wCAt7J21txITl8rwhAVRz
	YRCCCPK5R0IVBpCeoncldeJlDOTsnOq0UAKZnDY7uyDMQS+nm9R2JZurAUDiVEVp
	qPNA8pN9ITnQ6G3PVjx3TtsHIKdQJWvxJ9vNN9tV5RmeTM2X3W9ZNs04NCpBZ5FW
	w1udi8Mn7lDSPTVcYK+OmlwazJiD/N+2+Oc96v9q2nUDq0GZnemwR73Jxypgqliw
	IW++bV1Z+OlUzItsX0F+JkTeUC6lZnk4AuowlEGB7Qo5LGYl4DB7tORW8w/YkNxy
	qab/Fw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44p0dxp4dd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 11 Feb 2025 01:10:56 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-2fa2e61c187so6447253a91.0
        for <ath12k@lists.infradead.org>; Mon, 10 Feb 2025 17:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739236255; x=1739841055;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yL4f5n5ALnjcTNjuUgDIrXNo7uRjI8rEH+kWaI5WpEg=;
        b=F9yRoZxWu/EQbTQjIsbIQkYSLOhlPm5oZPnz1p9nagNSJAgC9sO7gwgEaqB2uA0mrN
         bAe3WbcdLnEVGOEeJaRGkJjkCIQc/S/7B3cjZlBRJo2I/j/KdoGysoHWEFrv2RACOZ/a
         jHTn+E7HXU33WxYGWll7+6HQvS1iQb922deoxZb1lNqNYBiRqIG7ZB4k9qn3gRLiM145
         M4L30M1VcPmkGwk8Iy6qMsKzh4461X+ZSXNZI1vplNXmpCkpWaXcKzzbcMisicbwIa2Q
         VcF+qhG+EhYSVxFU/4MyaA3MxrpzQnRDyAYrQfQskHspXVrhXEnrbkxJpX1NCse5TF/M
         DH5Q==
X-Forwarded-Encrypted: i=1; AJvYcCXfYr6WtJgnjAS6P+44SKPb/awxXoXL8eVbJEKUOs/jFBfR3fjnoJdgt6OETX9LoGHk/I5VzA8=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhu6A7ev6SA+SqVs72dkXodlaHL1+by+B4x66O424l8/lSQGm9
	j9WH/Rbrf7oEVrfFuKbnJvo27G/qPGq2uVkxx4ycOAkcKn/YDASaXnDZH9Y1KkaQKDKCrGsXvuS
	DSESlpl8u9QoBHfP+tRM/TJLp3M0BvuLJr92+dZkSXxwwuPcwcUTZT3Okdk+dsgPailjY
X-Gm-Gg: ASbGncuRCiisJw4M0UeikRO60VkSRZPriJukS+zcp5ieLvAv+Ht+k7DCr6ZEwHpA/1q
	6E0g95DSlF7vWgFLEW8CRxGR0wIiz00y+fLSu1nj22Kc7JB1xhjDBXW3H0IUQAS1R5zUGKrvheG
	WI0IClC6ADtYfgGPHLGUkzI5NAWYd0fQPOZuHlpE040FxHS50DVnhNCGQeYWzafX6A66+EkHwfO
	5ogd0UKXWh4GPtymyBTHZGSe9m9ZjdShCytDFDAZcNhZm0RAcptRhQvrJbtcWd3IWJ1E49PLhDg
	eD4UD6D29dbvA8x4JGhQYsMzxpFrYNtknvd4k2Ufu6IJvvuPX4xhza6NVBwwFHjg3lPCzDrh2A=
	=
X-Received: by 2002:a05:6a00:1783:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-73218b6e36emr2624617b3a.2.1739236255240;
        Mon, 10 Feb 2025 17:10:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPaQn58CRCESv9m28hrqPkugo+i3/O+kfXm4D8jm4EAic534rNtpoNdac5TSUoPejdQYJv+A==
X-Received: by 2002:a05:6a00:1783:b0:725:d64c:f122 with SMTP id d2e1a72fcca58-73218b6e36emr2624595b3a.2.1739236254875;
        Mon, 10 Feb 2025 17:10:54 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-730884f5711sm3131605b3a.9.2025.02.10.17.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 17:10:54 -0800 (PST)
Message-ID: <183bc4c7-5ae5-4654-bafe-509d7bfbd75e@oss.qualcomm.com>
Date: Mon, 10 Feb 2025 17:10:53 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Abort scan before removing link interface
 to prevent duplicate deletion
To: Lingbo Kong <quic_lingbok@quicinc.com>, ath12k@lists.infradead.org,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250124093352.481-1-quic_lingbok@quicinc.com>
 <44dc86f0-7775-4d47-9058-17cb048cd976@quicinc.com>
 <7ee0f7fd-7a3d-4942-8323-08ff9c4c8915@oss.qualcomm.com>
 <bc54e1fa-da58-48e6-a148-4a980833f448@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <bc54e1fa-da58-48e6-a148-4a980833f448@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: PYXWYH08R-UhWgLfwHr6Hr4REzCZBISK
X-Proofpoint-ORIG-GUID: PYXWYH08R-UhWgLfwHr6Hr4REzCZBISK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_01,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 adultscore=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=853 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110005
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_171058_691414_606C8F8D 
X-CRM114-Status: UNSURE (   7.85  )
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

On 2/9/2025 6:52 PM, Lingbo Kong wrote:
> should i resend a new version of the patch based on 
> https://msgid.link/20250204-unlink_link_arvif_from_chanctx-v2-8-764fb5973c1a@oss.qualcomm.com 

suggest you wait until the pending branch is promoted

/jeff

