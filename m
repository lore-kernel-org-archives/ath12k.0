Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA7FCD4F52
	for <ath12k@archiver.kernel.org>; Mon, 18 May 2026 13:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NBiw6w/Bl1SGBsyyxj194UhIBjNkUE0ezPyMhXtCx1g=; b=zBfyOg6PwzTt58bKkzc97p9Wn1
	hKVYOFqNyHO60dL20l2j5N8WT747hud9TvyfWqa+koAOUiPYiE9W4avI/XzAZwMWUQtrFgeWbmDdD
	nKPd3mCw7VsNe6TVhE2GxS83A5iIql7kaTUauIBCMFzsrDS9D5vvi/CKFNHGwCdaPyAdylKj00nZq
	2gUsiOrRmxC8zS2PxzhfEI1X0H55udn3Hl+jdzlopxGVOBfoJh0lo8csdfL05X16A5V+RYXc2TK0C
	31c1+PhHZnPmSu/dP0ZByDwFfM5eFkLNARcFiq0UvKJYwg2z1KURoLffjVK/xVPbahr270L1sRX+o
	LmdbLg3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQJ-0000000FsyG-38PM;
	Mon, 18 May 2026 13:54:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyQF-0000000FsvE-4949
	for ath12k@lists.infradead.org;
	Mon, 18 May 2026 13:54:22 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64ID3t3L753087
	for <ath12k@lists.infradead.org>; Mon, 18 May 2026 13:54:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBiw6w/Bl1SGBsyyxj194UhIBjNkUE0ezPyMhXtCx1g=; b=Tewq/jTYbdfC8IYC
	c8KqLEr+XDSrjVWKNFNfOqVMmGg3JyTF+BcwM94fl2+Fmgh+k0T1Lfy5Z6mPtkXr
	P6Yp6KhuLWyKac9YktoR99axAKIhTz0kUxTm0xG95iFaWDi66hh2rjdv7XnJWtEw
	lM8m14quth2rbUuuiy+Uw2gLCBqnJZqzwJwaxf/oec5vtYY86gWISiLEMyzLERSD
	aLdtdAO1StNNIY06JVv9fYvHO7k5Smo/vD39FdfINOl0WpbqBsU7e2PNKazgbMio
	aiAx6Ofxg+W+GAwyQvm4CS0uY+CMTUKgnG4mTzF4YxvpqCZ+0tNd7nIp0VP0t0n6
	UBnEIg==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e6tvcnkq6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 18 May 2026 13:54:19 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-132d631edaaso11578928c88.0
        for <ath12k@lists.infradead.org>; Mon, 18 May 2026 06:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779112458; x=1779717258; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBiw6w/Bl1SGBsyyxj194UhIBjNkUE0ezPyMhXtCx1g=;
        b=YsxmeJzNUThUaTAZMOBPkS90lm59ultgceGhSSvGV4b6op1UrYxB59Gwa3SOVBsNNs
         nlELSHCniJmdiZELQs5SG9oJm4i3u61/dS+sxLeBhGLaFt/fA6c8bO5Flm4R0WGNgJ7A
         PQGo2oAgbovAwMncIUY/yKUFOSLvQ7eWJ5uKFktqpICLohGeIhP2gKmgx9GoMJ2F7we/
         QpAL++y1i4pX7/J8D1M9DOTjWyUrlFLxJ2L0HdeitwblpFOakBLZ72TzET9vQfehotmr
         IVbTNEU6VUjuhnyj+lo3R7ybBwLgxhAyofr8J2XdkvUVu94yGAGu5ccSBa8Fuv8/KZ4c
         ZC4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779112458; x=1779717258;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NBiw6w/Bl1SGBsyyxj194UhIBjNkUE0ezPyMhXtCx1g=;
        b=nC6HhkX1x0H6ltbHCOO8/ezslYhLZk7C0hw2ilFy/Xb63R1WxbeOfCZv+exLTFfkxh
         uTI7lkPlbbyiInTMbehB6trzckQh5HQX0AKDXLqe60ugKPaz7Ye2Vh80kDPqHGb2afdk
         BBMvR9DvlUnfKKNx7DWZ/Rx6nf0gnLwH/E6o6cTHOiFHmIYlyu/KRoV7nf7+WuodVyL0
         yQgu1kJPk9bt7AQK9RWtnO6Q3SY7/+vXZRpihwOKWHfDKjzTgpRV9yrGcUYtVYINc/JV
         uz1BTgBW1UlYn4UsK3RAoeuq7nDLRL6ttkPulePYvPgswh0m/tciYifjhQDEmcwJq/MB
         xeXA==
X-Forwarded-Encrypted: i=1; AFNElJ+HEu61mtRW6xeR3LnAi9BCOXBH1eqsV7UeObTvhaodydquma4Qozfy906tB0RHUXkMJ6ili/Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YxbUBmixIG33+ATVOHBhgMV4Q6AStHxQXWhtqg+m1YZozfhbfZu
	fBgtOchllH+F50Gs/+8Do9qaDPeeAfxgSVWdHRFYp1iY73oTPDR1OvSaJlyoiEetII3OrZ7wU86
	6kQCrZtC1gLkZ2qOJ697FIhHGDxxoPxUYYaCTWNcKs7tXyi79gddovXIwZEYNBbO4YX7vbH1I
X-Gm-Gg: Acq92OF4rAnSHXprRZi421BvM6pJunJo+9KOOlznYuJkaS/hFrA4fB4+oEQvoRLJy3W
	Twd7Wba6fG6uIlDzrqqIUvjKjaOzWkFB5WEaiK0s3kBRF0gYI7cJbz+3/SMhCnKV6jUQLVLkly8
	1gZ270CT99U+9SG9K6E8OzroenHBaR8he4IBFmKKAG1dvZVEyi98+SOdLn05R1V19Hs5gJ1Anbt
	AeAmYgCRtZW4GZPzRLK6XDUUqCyVNFZPhl4/Oh4vr0tFaYuYSX/ZmJxXcc3KCZ5poXXtge8psyS
	XbMuag1SfCbKupF1bFnN6bPx9cy0VnrbtLPDP+uupQKHgfj0Nq4AnFGHe5ZGW5FP/r1McS8Dk1V
	kJxecTvqLrtKvaPxfYDWoFjdTC51fnNEMfDKHu7Mmi951DgjtjTVwXStAK+2I0M/HAi/6m5nTq+
	b56hijGFYXoOs=
X-Received: by 2002:a05:7022:ec7:b0:12f:1f67:e743 with SMTP id a92af1059eb24-13504a57b79mr6538621c88.40.1779112458476;
        Mon, 18 May 2026 06:54:18 -0700 (PDT)
X-Received: by 2002:a05:7022:ec7:b0:12f:1f67:e743 with SMTP id a92af1059eb24-13504a57b79mr6538597c88.40.1779112457870;
        Mon, 18 May 2026 06:54:17 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc33a618sm20870488c88.12.2026.05.18.06.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 06:54:17 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20260514-ath12k-fix-20mhz-only-mcs-map-v1-1-a38d4a9b21a2@oss.qualcomm.com>
References: <20260514-ath12k-fix-20mhz-only-mcs-map-v1-1-a38d4a9b21a2@oss.qualcomm.com>
Subject: Re: [PATCH ath-current] wifi: ath12k: fix EHT TX MCS limitation
 due to wrong 20 MHz-only parsing
Message-Id: <177911245724.2671480.16936967026360058275.b4-ty@oss.qualcomm.com>
Date: Mon, 18 May 2026 06:54:17 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-ORIG-GUID: bjNMYrXn5xvlygxvzLoQL3n2bvYtQW-Y
X-Authority-Analysis: v=2.4 cv=UIDt2ify c=1 sm=1 tr=0 ts=6a0b1a0b cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=MLNRGpfyw66JFDu800EA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: bjNMYrXn5xvlygxvzLoQL3n2bvYtQW-Y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE4MDEzNiBTYWx0ZWRfX8bZ0kA/oKfR6
 HiT1f55aW8cLIU4uG+1HBCPjKFdZcSXcwbq6EueVVU9TIZVn7Gn/WBZER6woMwOGKSI5z7lB+Pc
 3yhoKpTq+3YC1EssGWSP6/8LCNSHnd8tkojiGhDJYQcj1ziuI/gf3QH+PCYK75YwxGbxsMfUz+E
 GjG2CEg6gUVkHRe9EMbXDjsI38oMPqkIozZpnzOvZOJnN+1qTZEgdcxE5eY6ORZ+x2t2vbzbWBm
 GhVpmRRB4su7tTmKgt4XKmI87YwD5K5l/TgLxSwGtrQq/K4CH27wh3Mdp6T5cJ6djPnqG3WWX9/
 XvMfc1BAPZ+OUn8d9eEyEoX203f0mC6Zurr1ho3vJ7mLH/87tKzvYZfb0PPbaxjIX2PFAsnsBCT
 nDJKFA//vMPTbigMQkBqN9xLaLd+/fuIrzETj38tAGzc341kEihhbcLs+jTtNwHUV/F1VG68zRH
 Fni3rTho6JebRCP+Jxg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-18_03,2026-05-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605180136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_065420_040115_67159591 
X-CRM114-Status: UNSURE (   7.02  )
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


On Thu, 14 May 2026 11:32:51 +0800, Baochen Qiang wrote:
> When connecting to an AP configured for EHT 20 MHz with a full EHT
> MCS/NSS map (supporting MCS 0-13)
> 
> Supported EHT-MCS and NSS Set
>     EHT-MCS Map (BW <= 80MHz): 0x444444
>         .... .... .... .... .... 0100 = Rx Max Nss That Supports EHT-MCS 0-9: 4
>         .... .... .... .... 0100 .... = Tx Max Nss That Supports EHT-MCS 0-9: 4
>         .... .... .... 0100 .... .... = Rx Max Nss That Supports EHT-MCS 10-11: 4
>         .... .... 0100 .... .... .... = Tx Max Nss That Supports EHT-MCS 10-11: 4
>         .... 0100 .... .... .... .... = Rx Max Nss That Supports EHT-MCS 12-13: 4
>         0100 .... .... .... .... .... = Tx Max Nss That Supports EHT-MCS 12-13: 4
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: fix EHT TX MCS limitation due to wrong 20 MHz-only parsing
      commit: 60fb2cf51e77bb1c0261160b4be44209d68956b1

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


