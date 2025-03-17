Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E206C282EC
	for <ath12k@archiver.kernel.org>; Mon, 17 Mar 2025 19:18:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ThkuvgvIoIQWvJCgbTnfJTeOWF1F93DD53CLoYLqJs=; b=oihPvCVun+BbmLzIdr28BgnyJj
	WJTkvLNJbJPIBHsUOQLxamDxAOj0hnEesuCFMspWlR3xxtR4UUymiKsvUjD6Pc4ZvYLsAHLDKDM6u
	v4uK6kAAQdHd7QjXCTqX27P+tUI3lV04w44cGkknuB0dY6OSby7ADjth1+3JNVLzE97xbFnRphAKu
	X2uhqHEM9EBm5f6VWpStl/Tfjqis+HKbqOeyaAEfaWkLirPrlhHyZJbq3sbMO4C74aV7ZZDRY5Xq0
	pg+6DLtKOh1M8YYw/TSZwdOEBqRpSd1/boW3Hv3Po3IrVwh9GmxEX7dkQbKJFzfWMd6dp25vkbmKr
	rP8cloOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuFzH-00000003nju-0stQ
	for ath12k@archiver.kernel.org;
	Mon, 17 Mar 2025 19:18:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuEdh-00000003baK-2hd4
	for ath12k@lists.infradead.org;
	Mon, 17 Mar 2025 17:52:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52HA4gRW020505
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 17:52:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9ThkuvgvIoIQWvJCgbTnfJTeOWF1F93DD53CLoYLqJs=; b=Ldbe27MD7shiZJ6z
	trap0DMc0bD/dnbWlPP6sai1pI8JA5eDWuBBXQZUl0/K0xqDObaKp9edB9vrnXzD
	b1j7WWNamgQITMBzo1ZAtRWVOv7EfNJ6d/xkWrEoWP4d3kfo/B3IeJ9AHHcUF5Zc
	TW5m2jOKbrMJZlPhSv5obZ1GRlArcB205M0QQLm7kcJ46uH/2MqoVMpUtZSeN1Cn
	fzZiqSE/XnzAKhqCCh9MvNejKnoGrzbZf80AFh9M2f4EoagDS+ViEHnFuHP3sGWL
	YS/qpP/8GouoUd89Kdm9mL6s7nxR+gKXWFwF9RarPd+FhZuZSBuyzXM8Pvgs9CwP
	Pc7NQg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45d1s3wkk5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 17:52:36 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-225ab228a37so64490315ad.2
        for <ath12k@lists.infradead.org>; Mon, 17 Mar 2025 10:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742233944; x=1742838744;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ThkuvgvIoIQWvJCgbTnfJTeOWF1F93DD53CLoYLqJs=;
        b=Xd6pDzOoaobjBRBj+aEhmYeICF56BbY41FAP5+m74gBguHT5DfZRb6Q4zyhlFkjmOl
         aUYglArNRTk32WUziBbNqXnGrUKhdN5npuyA9mFdFx/dOSndHW+pM1wVL+4+JekK9dqc
         jdM82m7Or+LcYDMFsjjpe6Bo3+LeBxxevGw0taXnqDJVeYG2FJY1Pu4ckcwEPfCqGhM8
         5+fMf6uwQBksWv5DlwAH3SofyYrEdn8fGDDpbsWh7Vbf5jrRSExSokhPVLMmhlTWUUsL
         3raz4cgZcUCD2fwyIgXvWoG6n1iOF+Ugm3L6XNQtHmvrC1TIgePeDii5b32WgIP6rmSs
         kxBw==
X-Gm-Message-State: AOJu0YzZnR/W6v5ylT5GB8NWwRujd1VtT73qSxM3ockPrTEcS/HTXolc
	/GrgcLTNMk1pV7r8aSrmsz1j43HK279b8A/L30IfFZsMiYu1Eo7RKG8UyXI6PmbYdxtuVWZtdrp
	M+2NZztFAoD+feCvvfIFlTXFpYD7+Ioh5naw932whWKgNfschphTCzaQ8I8UcQLtcjkOb
X-Gm-Gg: ASbGnctjFlzJLCvVjW1nUuM6vpzGmycDB21rKXlYy0q3M99Nd2gSFwvWPQRDCj8YJjo
	h2nEF7OaagRmbDsadipyh1ZtGPYqWuoAjVbsfEZcwqR+Vh/ckByJMaHxH7aosLyAbaAcUOTjqME
	FYBNTK7FKsLU/U5ZlgBvg5gsWoJvLHfpk48YeW0Hp5b4Y5Bpeuy9ytPfHm3Gx1L9bSXzXLmqAMa
	qHncLQlDTiN5mThVqyD/VpT5BLsemUalbnJy3JtlF24GhJq9inZGZkJa7teyq7utxxjbciZjWet
	Qt49wSuc5QNo0zY/uW9XyPoKfTmzJyq0EJNFshdmpLrX7yMgtMUf
X-Received: by 2002:a17:902:a60e:b0:223:35cb:e421 with SMTP id d9443c01a7336-2262c6118demr4495345ad.49.1742233943930;
        Mon, 17 Mar 2025 10:52:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGgl+llvwHh/zRGTkW5MA2eop0V9Bnfag9v+roXQRz3G70mxDf47IcOnVb7guN27vvjEWny+Q==
X-Received: by 2002:a17:902:a60e:b0:223:35cb:e421 with SMTP id d9443c01a7336-2262c6118demr4495115ad.49.1742233943573;
        Mon, 17 Mar 2025 10:52:23 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bd5ce5sm78291485ad.252.2025.03.17.10.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 10:52:23 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
References: <20250306102215.1300522-1-rameshkumar.sundaram@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v3 0/2] wifi: ath12k: add support for
 get_txpower mac ops
Message-Id: <174223394296.578193.9070355387885587986.b4-ty@oss.qualcomm.com>
Date: Mon, 17 Mar 2025 10:52:22 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Authority-Analysis: v=2.4 cv=WbQMa1hX c=1 sm=1 tr=0 ts=67d86164 cx=c_pps a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=SU2plV4fdfOFeIHhBLYA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ujVSZdQiYCPfCMpWGQmCjCKarAGqWyMX
X-Proofpoint-ORIG-GUID: ujVSZdQiYCPfCMpWGQmCjCKarAGqWyMX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-17_07,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 mlxlogscore=999 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503170129
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_105237_692211_690E5379 
X-CRM114-Status: GOOD (  10.46  )
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


On Thu, 06 Mar 2025 15:52:13 +0530, Rameshkumar Sundaram wrote:
> Currently, driver does not support get_txpower mac ops because of which
> cfg80211 returns vif->bss_conf.txpower to user space. bss_conf.txpower
> gets its value from ieee80211_channel->max_reg_power. However, the final
> txpower is dependent on few other parameters apart from max regulatory
> supported power. It is the firmware which knows about all these parameters
> and considers the minimum for each packet transmission.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: move firmware stats out of debugfs
      commit: b8a0d83fe4c7a8d5c060eab91d9cc16bf0dcaa46
[2/2] wifi: ath12k: add get_txpower mac ops
      commit: e92c658b056b31fbc923a59bd72d51ca9f2ba921

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


