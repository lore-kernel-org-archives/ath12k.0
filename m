Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39FEDC5B56A
	for <ath12k@archiver.kernel.org>; Wed, 12 Aug 2026 17:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:From:Subject:Cc:To:MIME-Version:Date:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=; b=Uj5zuoqiXu7avtrDttQ96NL8u6
	fKBIdTYeppxj+PXuEZ++UvK6el2LG9L766WvGzY+FMm/mYU2WdA4cbhgq8Zi6qyCtXP6BfsizOljd
	zCzmBoOPPKJF48kZHe6204oIuVaGRv45Ehb//NTPgwP58YLF8XKVWOsWyrM8+fsZ2aMQwwPfNwL+0
	TL/96KSlk7MsbsUL8NxoYQYoFx/sjGtwe2HhW3LhkK+u2+loWo6tdD11tmKaBxjDK4Tj2FNCXCJ1l
	KPCoreSfsIOUIQEoZGRVW/4z67B7HTC7W5hV02u1TRwAj8cr7HsmlKoPjXLn7+oM8C6QdZKgIkbmW
	TRAQM42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzp-0000000GiBs-2j33;
	Wed, 12 Aug 2026 17:44:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuCzn-0000000GiAq-44ko
	for ath12k@lists.infradead.org;
	Wed, 12 Aug 2026 17:44:09 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CGpr1r4083618
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=WPrUe1AHxk8839bSM8P8eF
	DTJ+/fnhI9uw2/dmjlgD4=; b=bmyaQwomX0028YIjqP24MgJYMgs88YwzsbdR2u
	+T7RI7MyNpTaNDbpHDSTcNimEmT5jUBZIKm6A8RznJU6gn5Xt1qgUVkm7etEK1ol
	eG6vKMv9gQ/WKdb9BDI6HQwq0OxMSC5anSpaI1olVLYhu/fgcYaLWM7xlfe/mFHH
	qf33+xWrsYM2meKe8wnuyQSnmCS0SzzAHTZEWW4ZBjiqTorwh4Xpm4c2wMAviDaf
	Pc7VBegBx4ffmE+JxRe4IxjIv9SbALVkyLsGhccYuntk0Fx+aTmwIgC3YzrADn9J
	jgTp4aUvglL6kwEK9qC6cGmlXmEVwypjFRpq4eKd1ZK5JQig==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0pmyt22q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 17:44:07 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so1373052a12.1
        for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 10:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786556647; x=1787161447; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=j6BJjWhWvfa+PB/ix+Ev7N8PMlbo3TT8gn8Jy9lFLEreTGqT/0pvHMO22H8QiPJTzk
         uIg1tj7JApBlhng8JcwdDxR7dlH8LKR4dhPOf6PF47mfeAOBppMdu6YWFgQWaM07DjXf
         R98ca/z8r7zJVGgK3VHD7C2AlErs5jArlSyC5MdeLK1rKeQOPrz105QVtPsLkjVrXDlr
         wmrCc+1tepPEFSpOGzodKT7QkahWaTb0sRqDvnRkaQb7+HkFjJjq+DDWb0Luixo3blya
         VuPHVMpobILJX9+JZ/2qZkwcrjnsRP08BXhiF0JH6m2NtU0Sdu0A7Hg259Cd2YK7zs2S
         Wupg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786556647; x=1787161447;
        h=content-transfer-encoding:content-type:from:content-language
         :subject:cc:to:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WPrUe1AHxk8839bSM8P8eFDTJ+/fnhI9uw2/dmjlgD4=;
        b=Hb2Oxgcqc55OXefqX2yL6Jm1caoKQNyg01S+ImcRj/MUV86bnZUSW8MZxZDCz4xv6z
         UIPS4Ckh4qZaOsHKZXewfG/clu+Hp+ymYG474kYMb4+Fj1HfDHd3Ch4Tmhy8m6EA4w28
         xKYA4ZNR3GSGDhQJqE5ihDobVD+FuGWGFw/Vu2gFMqEN/xYQRPt+I2A0gKsl0myPp4pY
         +vufyMWE2wKXYcCCZ6jGvA2NcobtP6LQqFYb0iGyBuyGbyXSdjenTBFzJgEfa7w1ttIz
         He0dIi0l2nl2R0ZDuPJo1770LHkguV8p3w+Dbr6gu5PLW8371Zjepa4J71M9P1Kb8jjA
         2TiQ==
X-Forwarded-Encrypted: i=1; AHgh+RoidPckgCxXqFEyZdc5HLY9fVxwLi7srwf1FtGy65J6bw3kv7nG5NMWcPhRCJqOcB2bmkSgBtQ=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjyueTVvOCB+bQCl/K95z6AcEIbD7vJXFSX+O4TegQvbJfBmtm
	cs1kM2IK9KGUXLZp/S4nY6shSqfGPalJg73TpkOtF2c166vSzE9ZA04X5y7YktMcT1Ufau4lsyy
	kktHZfOyosOY6A7LT9h9SnxhTPR1HP0chmNWet8xLwdiELzko0jli62Mo6RJb+uTg
X-Gm-Gg: AR+sD12mi2NeU2zY0gGL1BugIqwBAin/HjPG1W7q3oeFc9ClaZTkod90idhpVkfsx6Y
	q9nTURGBppsyktQKAkJt/UNu8tLHGHgkqongZhzLP35f4HHyjAg3zcyPeeLB1VBS/9Czwo8dDkf
	38uqCcMTAAbrEaaeHG0MM2J2B1CT8Ivy3h0DbMoJUl4C3fTxh3cd+W2fAUVFXjWwTgLW41O+GeW
	/HL2ho1CjJ+uvZaNTP4Gtii/glXj0sQomqgtxFbJQQvQyXjUKId0yqphd6PhvQEqOSv+iUffJHF
	MnlgTz6VRNzLhV57U4iufPNkbhn/kJvIVirBxye5gzeJz6tTtLTttbYy4miuO3kgEuz9L1MPTaf
	5nsNITnWRNaPkGLiv+WYEhA/fdoJFdApBcY4I
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93761637.35.1786556646803;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
X-Received: by 2002:a05:6a21:a4c2:b0:3bf:d487:4b42 with SMTP id adf61e73a8af0-3cc553e6c70mr93709637.35.1786556646396;
        Wed, 12 Aug 2026 10:44:06 -0700 (PDT)
Received: from [10.81.91.45] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31e65ffc056sm966106eec.27.2026.08.12.10.44.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 10:44:05 -0700 (PDT)
Message-ID: <7736f627-e80d-48f5-a11c-97bf81597d6c@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 10:44:05 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: linux-firmware@kernel.org
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        jjohnson@kernel.org
Subject: [PULL linux-firmware] ath10k, ath11k and ath12k firmware ath-20260812
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfX3K/9pQu0z5IO
 CnMoXQRU6pmFlMKorak/jR4yjU4VbDjlP+ZSldbzEltd//WDfTdjqOPnV0mMhkdjI3Vz3IHtE4V
 rxWQIzJBTgLno+QpQIRlDq4Qgq3Te9E=
X-Proofpoint-ORIG-GUID: 6pzbhgjVD9vLwZ9JwuDcC8Ug-urDYfZf
X-Authority-Analysis: v=2.4 cv=C/fZDwP+ c=1 sm=1 tr=0 ts=6a7cb0e7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=-bKND4alXjPcxD5Ql1gA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: 6pzbhgjVD9vLwZ9JwuDcC8Ug-urDYfZf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE0MiBTYWx0ZWRfXwsGmn9Qhq2uc
 R3db+0Dog0IntIv9N2ergQXxNsGA1GpuDGRQyKxBeaeJ9mBIUWwdngfr197kxO/TNu/QVAD8d8B
 JMkLyVYNtuL/veO6eNSL1jcPvz2MaX1gRtEKBfXTE7G0Yn+CnblE5bDkv2aL8F4pjaf3TXJw/g9
 AeGVLRut+jMdjUQIfCX2PRUTWZc9kF02gLPja6PU8iIjuXbfs6yFpXZc+6RQx3a3OfRHwjnMd0d
 ftpj8Slbp4wmsAdpep+MKmTrGl+MNjwTw2/aRVJa4xYVpNx8g6Ru3Cmu4Puxj4OyVprtA8ic1ZP
 oeScJTHE7ftFImvrBCc7ngsiajS4ErX5VDOTUJFpkFHamh8QAgzg+srI9P6KctO/lG/BLcRW0Y8
 x3xD4qgtZnCiqWCRWYnP8YW+yDxYfTScsq49yZ66xRfoxBD+Zip1QVJXTUUkyV9jDb3ifFYctcF
 sBTWxAkeUTFGOVJsW1g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0 malwarescore=0
 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_104408_029546_4873C92D 
X-CRM114-Status: GOOD (  10.09  )
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

Hi,
Here's a new pull request for ath10k, ath11k and ath12k firmware.

There are no changes for ath10k or ath11k.

For ath12k, update the QCC2072 hw1.0 firmware to WLAN.COL.1.0.c2-00228.

Please let me know if there are any problems.

Thanks,
/jeff

----------------------------------------------------------------

The following changes since commit e3c0c4b70f50ae77bea557b4a44be04413d3f3ed:

  Merge branch 'robot/pr-0-1786456716' into 'main' (2026-08-11 14:02:21 +0000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git ath-20260812

for you to fetch changes up to 25c06030aa434817928ace452c06f095f14729d3:

  ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1 (2026-08-12 10:31:06 -0700)

----------------------------------------------------------------
Jeff Johnson (1):
      ath12k: QCC2072 hw1.0: update to WLAN.COL.1.0.c2-00228-QCACOLSWPL_V1_TO_SILICON-1

 WHENCE                              |   2 +-
 ath12k/QCC2072/hw1.0/firmware-2.bin | Bin 7111860 -> 7148724 bytes
 2 files changed, 1 insertion(+), 1 deletion(-)

