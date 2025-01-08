Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70A20E77188
	for <ath12k@archiver.kernel.org>; Wed,  8 Jan 2025 15:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FzJXpnxpbDhQRUUNG2bg5ox3iaMmNxH3xkMCkyytqk8=; b=PXbjWuJ879FDpcGMJanwNl6Jlc
	pHQQSfbKAPQXaxBrLERvMIlkWupuHCPDHWukrrEvBSI+SGJeR/nWkLMAXuHxyAtEGIev2PEMB9Yjr
	lgCe3t7GDFp57dqizICNu3O3reQCnd6wMyDaDMSgZd4RTGHMjOnATVMADfSlnsS1RUGxKZ4gxM4DT
	YEDes+cmgPjjvgfbg2aYghXAgJOd5w/uhCAtjuJuAEtrqdVkRQGd6UI43/Bzr57T6x+FwPgd08D1X
	dbhrK/iT3b1HiIWT8gsZ1EvxpEMMUCj4KcMevh9zbBfwx36NGq00xvH6iUVCuQiIpqXnG9O7Spil8
	OD+2y9rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYSf-000000094eX-0jVU
	for ath12k@archiver.kernel.org;
	Wed, 08 Jan 2025 15:59:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVYOy-000000093xa-1fGT
	for ath12k@lists.infradead.org;
	Wed, 08 Jan 2025 15:55:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 508CLcxQ028226
	for <ath12k@lists.infradead.org>; Wed, 8 Jan 2025 15:55:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FzJXpnxpbDhQRUUNG2bg5ox3iaMmNxH3xkMCkyytqk8=; b=N91i3mMtytBm+nMA
	/XM0CFQTtP6X1I0DLT5L/Qt/uFOhOGUD4wjM+TmhDimLOBrJsk0R9q1SJhkMZspb
	jHdNR2w63nUYgHSJFDLavoJ0D22cvKrTVqHlC/W0wIE9d594bMTOzDaR+k/qtlH/
	VrGrM/RY8qXQIfs5jxfUwPD+Q6qDsRRveFcR7YJAnYzEKivVE6mybhDCAiL7fbuG
	yjumjKvrL6WDLpiK9iekDAFBgdw9Wl3UJAGvjxWGW/4TYD6dAUlfZRQdWdbjpWb0
	PXheC3mP/iM4MpY3hC2mY2cfWaziYyoR553c78HbmgOxMf1eqOpxEnaDcjQPQdP3
	3aScUA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 441sa28fd2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 15:55:23 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2163dc0f5dbso218419755ad.2
        for <ath12k@lists.infradead.org>; Wed, 08 Jan 2025 07:55:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736351722; x=1736956522;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FzJXpnxpbDhQRUUNG2bg5ox3iaMmNxH3xkMCkyytqk8=;
        b=c2tKi3q7SrOjBMubsvr/girj4eFCm6+OsonjGqk44DO85qlYoY1SQfv+9Kssan8KtB
         l52eXPvBzykBZhPrZDE8ZwV/2FIHk1wkoZ1r2qwW9V6AnTxJV91f71ipI1gnXcKgjbNy
         qrfp8UXUpM4/duHBks9CSnLUlW/VGe94hLuuOwGPDgIJqsVsPJ/PuMDkXLTp9NE41M5I
         5iR0Vrkt2KaBZmsX2gFJMLiC8Mr6Ef7KOzJD/31EmBxBh/tNOvaZomE1fwHnpIdm7QOX
         oPRIEgeWNiV2im0cjlMjA+1AdLQDRBVKIVfL38jyB8AX2CS80F0DJh7PAnTRKE2TsaNO
         JJqA==
X-Forwarded-Encrypted: i=1; AJvYcCW80sqaIDpgKq5aX9Ra9L7JUli3eyOlrnSLUYvpYVmM7PmWIWtpdfKJNO9cdIgPhtWYPdLoG7A=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh5SaVbPT/70b+bYUebQxX2tZka72Qrp5whuvhn5xyEa4NwJOJ
	5Ycw+dq/KdQNjomHefm0A3AYSGwGRc4JL4jUWV2TkE3IjKPCv+b+OPDdtn//fVfGh+H1ZhPzog1
	gXQ5iXacqGbwNknS6tceEAlvu38lUa0sQH4BLrYV+la4/mFpPOAo0Q3wpYpTtWJusk+UN
X-Gm-Gg: ASbGnct4Q/G2ca2vyRHLf7vz+8NetXscFa83JnRE8yjwfNKg7Oq6a2B2BMjT3LtgRjq
	WLssEerYZ+4soozWyr7G8Rt/O+3Aoiji27rTaD16L6/KOoJxypt0brl+unmrZHeC+phs7oEeb/F
	ofnLdpaR1rTbx4wNMCmw0sNxIkOuix0y/KSlIN12PHi97EiTYVkcio5AkFkB+w0wUB3gJaMHR9+
	8z/U347rLxNdK36c4HzVoTFmgDkjTwMjlKTMrw3Z1He2S/CoBuZrFJi8inT1c0w+pv9WvQZYkvn
	isREZISUPqVeMD5gLx+siy8OOyk2fR7wdlJlbQlzoyXO9XXkrw==
X-Received: by 2002:a17:902:d4c4:b0:215:9ea1:e95e with SMTP id d9443c01a7336-21a83f591c3mr47578535ad.13.1736351722042;
        Wed, 08 Jan 2025 07:55:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9nXlV4OJFC634uTvp1BP/oG1W9qxY5GSUwAl9t+gx7yULZafg7e3yjy6PiE0GwXnpLo1g0A==
X-Received: by 2002:a17:902:d4c4:b0:215:9ea1:e95e with SMTP id d9443c01a7336-21a83f591c3mr47578255ad.13.1736351721669;
        Wed, 08 Jan 2025 07:55:21 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9d4495sm329558215ad.113.2025.01.08.07.55.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2025 07:55:21 -0800 (PST)
Message-ID: <b86a2af5-2276-4875-9b53-c3f43392eb5e@oss.qualcomm.com>
Date: Wed, 8 Jan 2025 07:55:20 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] wifi: ath12k: Refactor monitor Rx handler
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20241224143613.164921-1-quic_periyasa@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20241224143613.164921-1-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: xqh_Y51QObCDwfC46_U7naGQnuWkKGyP
X-Proofpoint-ORIG-GUID: xqh_Y51QObCDwfC46_U7naGQnuWkKGyP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=713 impostorscore=0 clxscore=1015 mlxscore=0
 adultscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501080132
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_075524_455114_CCD009E8 
X-CRM114-Status: GOOD (  10.24  )
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

On 12/24/2024 6:36 AM, Karthikeyan Periyasamy wrote:
> Currently, monitor support is not added. However, in the future, the
> monitor will be enabled. Therefore, refactor the monitor handler, which
> help to add monitor support in the future.
> 
> v3:
>  - Remove the Acked-by tag

Why?

If you did not significantly modify the v1 patches, you should have propagated
the Acked-by given by Kalle.


