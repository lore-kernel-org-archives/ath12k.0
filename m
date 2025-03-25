Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C19F0C3600B
	for <ath12k@archiver.kernel.org>; Tue, 25 Mar 2025 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ftcTynJFhZf6Ou+y+dlXrXlxZij+fB0u3WfPkqUsG4U=; b=ZXgaFHc+1RHuKRTAe0xGeibyw9
	2Ybc1D8bG+hA8iD4Jp+24k5zRTQpVVaQfa7HjjHlpzG5JidHXoKpZF1Sz00O4Jjv9VDa9ikyuPjll
	L+vsDyRjxBDq28COUcGDqd78LpbIERsEGPx2SgaCFfDS6xGQoNHD5ytyemobbeN2CSHSrGzCSqRXg
	fgaFwdC8TPtjl3vaQyHg1RT2gHkWMduGXhZF4yMWYuNI53i7gavwS4/WxCRakI6IaBSxknidN+QUc
	/yVH9M5qiDAL68jwpW7XrM66zyo64MEs1cfMNiAq/0wznA+LibY61mS2Em+0n67K1Z3ELWGhHcL5F
	akbIFPCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx7lY-00000006Zb4-1yCG
	for ath12k@archiver.kernel.org;
	Tue, 25 Mar 2025 17:08:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5e8-00000006FXP-3nJF
	for ath12k@lists.infradead.org;
	Tue, 25 Mar 2025 14:52:54 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52PDBA2Y008305
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 14:52:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ftcTynJFhZf6Ou+y+dlXrXlxZij+fB0u3WfPkqUsG4U=; b=FanOVWdvToSN62/b
	eW6+fkKgH4vKcZ3veFc7yfEXb+Rr3khkkdMVXH6U1UngLzagHNH6F8cDVe+5QzUK
	GEvsefQhWHyPGgxoycMaKSqp+uUa6FGNvQZ6eSYptJYBVpOi85dAdcMVii6iAUXc
	LoOCgBP8f7ATs6TwAo/cdvn7fRcI6yjQnfoSX9CGGUaMtKcLokmDSv8xqbg9kCdy
	vpbXnUN47r/V4Je8/mPr7Jhi7ZQqrxHnzUzYZ038VEyzPTsGi218JIhRl2LdkxDa
	QAGGMHQt75IEy/E8WGqNpY4yWgv6z1Rzur4ltIHdTVSgOjkLLjQ7TALPvrckcWg/
	6KjDZg==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kjjf26t3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 14:52:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-2ff6af1e264so16287579a91.3
        for <ath12k@lists.infradead.org>; Tue, 25 Mar 2025 07:52:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742914371; x=1743519171;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ftcTynJFhZf6Ou+y+dlXrXlxZij+fB0u3WfPkqUsG4U=;
        b=BAgqPYnHfZOg6T8sIl9HmYcQBEORLX9MLnsnBv/QAnscGswac8l+KRoqNJ1ytXNMsj
         ohQT8Z5IajxD71k2amP7aRRmzuSg0Cxw+l1XDXJDka6t1DX7BERtkbcdBY0iU9sVH3ND
         jKl9RbyVNsOGx8lxEzQmc4GK6OEyUZdpUdCA34OlAe5aw/GZjAElQaGzILfJqsDoUgrp
         3ulOrvbDKPkeEvfTC/OyzoglMC9Ef64iFUSZiq9O6+81blPPoKmUeHPT38i0o4bJBB0h
         P/syOcrcWd94mBSYGWt3PoLgsFrViPeYwS20HEqe3SUpsfrD2sx94SqRd5chXaEhNK50
         uxUg==
X-Forwarded-Encrypted: i=1; AJvYcCX/F3mp/GUxADQMv4ElVx/6GrKoBITieLcbCiFvp9gA9PJpsuTPq2jlwN7okDzTgZT84QkmEFc=@lists.infradead.org
X-Gm-Message-State: AOJu0YwhgDf4neHJOPXnH/7MeOvZLAow44p9dqp90Bdn/ovrq4kL2/HW
	hVd/44J6AQwn7hMzkbH+rBuzbrZvdV3vTmJNUlz1NmmIf97Rxw+eNT2vUu4rD5N8t+WVcS2KWKR
	8jWkOn/xCD0JtsX/sjWn/11H/3FT33ORmRkMvR4oEDbGsYH+Qwc2xAfZT13PX
X-Gm-Gg: ASbGnct4ZT7b3m7U177qlWLJbdxedeB2CgQ3a69ikfJuXcn8QR5xbFGkizRofDqhn+I
	pDJBoOkMtpbMjG7fkLPxmE/sKEHkcJw7uuOVDqBAxc+tmBTB5RgCbtoIrt0SL5/cHE3ecw8D8A3
	FrwiWN+JzuvSB92IUh9R/ZBQ2HfLwsigjBnZ1cpHMC5GpDQyzmGlungDiWeHEQcNZDgstnc/9A+
	p/m/WBOBM7Bk1Oz4YytsTSsp7RoxMQ/Muxj3sP2/Ncd8DJ6vDNcuXYV975MqlBEWuPVtWzD/zkw
	KVE1SfQgygn761Kj0Jj/NwSbHy2V/SBqjRo8hAhKXIjDNvw9NSn2
X-Received: by 2002:a17:90b:4a44:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-3030ff08e4amr25846269a91.30.1742914371011;
        Tue, 25 Mar 2025 07:52:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGq37xgRTdz1JPqWrLC0RaHjS1VYwIHPt1R/tO8cE0n4o8nk/6ax8nuzgtSl/hVZJ/IF/xkg==
X-Received: by 2002:a17:90b:4a44:b0:2f4:4003:f3d4 with SMTP id 98e67ed59e1d1-3030ff08e4amr25846235a91.30.1742914370543;
        Tue, 25 Mar 2025 07:52:50 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3036c973cf0sm1136656a91.1.2025.03.25.07.52.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Mar 2025 07:52:50 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
In-Reply-To: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
References: <20250321-ath12k-dont-put-chanctx-in-arvif-v1-1-c8e93061952b@quicinc.com>
Subject: Re: [PATCH ath-next] wifi: ath12k: don't put
 ieee80211_chanctx_conf struct in ath12k_link_vif
Message-Id: <174291436978.1215324.3680053989987464544.b4-ty@oss.qualcomm.com>
Date: Tue, 25 Mar 2025 07:52:49 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Proofpoint-GUID: JWZS4nvO-AO6dFXZDhWvlj5VMpn6e-56
X-Authority-Analysis: v=2.4 cv=Hol2G1TS c=1 sm=1 tr=0 ts=67e2c344 cx=c_pps a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=2YHuQJzV6Ps-Yg4M2TkA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: JWZS4nvO-AO6dFXZDhWvlj5VMpn6e-56
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-25_06,2025-03-25_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=794
 suspectscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503250104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_075252_954066_4C5B7BBC 
X-CRM114-Status: GOOD (  11.22  )
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


On Fri, 21 Mar 2025 09:45:53 +0800, Baochen Qiang wrote:
> ieee80211_chanctx_conf struct is not put at the end of ath12k_link_vif.
> Note ieee80211_chanctx_conf has flexible array member inside it, causing
> below warning with GCC-14:
> 
> drivers/net/wireless/ath/ath12k/core.h:298:39: warning: structure containing a flexible array member is not at the end of another structure [-Wflex-array-member-not-at-end]
> 
> Although there is no issue for now since the array is not getting used,
> this should be fixed to avoid any potential data corruption issue in the
> future.
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: don't put ieee80211_chanctx_conf struct in ath12k_link_vif
      commit: ce0779378c62758a0c503bf85e643c6d8f343703

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


