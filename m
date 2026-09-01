Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62627C61DFD
	for <ath12k@archiver.kernel.org>; Tue,  1 Sep 2026 01:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=; b=1LjtNnuFlCBaRXlr7tVwvW1J4B
	FIfd/ieUZbT0ggk6XocCwFTyV4Ln2xNzwMJvp0TQ3uH0iiS6bq4YKUab5iFbzOHcMpEOxToKCT8Th
	/jednoPmVFenN/Q8+U6YBTZVGO4hxcEIqvaq5km2KoMkxLKtwWeC3VdcvVwkpUGemjGMmpBx/0y5S
	k2YZl8yY3QWNTJ7XyzK5+WJITYGhQn4yK3WnItdao2c43kTq3vrVxorSRwt6HWaqILPb4iHawp9WM
	rjDr1KZ8AgDYKR0tHULjUblS9k/rjNWDw6fEq4hZiSa9I2zEtCsa/Vl/gi7OFSmbLfCb5eOiaKaFU
	eyoTwLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dfh-0000000ApDe-0Cuv;
	Tue, 01 Sep 2026 01:52:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Dfe-0000000ApDJ-0Tuv
	for ath12k@lists.infradead.org;
	Tue, 01 Sep 2026 01:52:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6810orGf1061539
	for <ath12k@lists.infradead.org>; Tue, 1 Sep 2026 01:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=; b=F4UdnJWse8Wo6ew5
	R6u37rQSAUg0/2vPiAvQmwnmK1KhIW53x4xtnPG4+5WSClh3+na15cFmAu9ury3+
	xosxq2M7PmHFyCdM1y7+n1ECcoFD/RGSz1COfySCRBYZvMV7fIfChLZpCX+pJqLc
	Tolh1S/6n3lpjDrL+PUlugd7UArkgzjn5ytAFvb3pCWAaW4KKC+GbKHjIyatalV9
	QDhvPnF4yr7XSO26LKCjt8r76FqU75HLHWLvMOkSafg632ZvVAVpRXYNihYdYxLJ
	cm5k0rRs9PD9b0afbIrEO90UqVgdO8LcY6h2pRVuvvfwi0fMdeJQrVTF7OIO5VaP
	eStxPA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gd6rbc6ek-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Sep 2026 01:52:17 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38ecc48b3c2so7176150a91.1
        for <ath12k@lists.infradead.org>; Mon, 31 Aug 2026 18:52:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788227537; x=1788832337; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=;
        b=YGJ+eXV/QbkgLcyMX3PEqw3Q7PcbkISnBif2N+PrJAtLVHw3/IuvVP4JIpZbAIeb4H
         XU611Tb3AYhbIzbxIv9cvPIkeX8WEv00rCWh5hsy7VNsZX2BjLTqK7x9hURilwII2plB
         pgZzYearwAcFgO/RqlLPhvmyawiwCjBZxUcMcckOvHf4NFoxz5HKum5nsX4LluIrks+g
         UuhWsjBXz89cQ6lkikPFzsZZsm8kU/u/4N+M4maFBoU9nFVPI3Neexhj/b00WZGPY7Uj
         RVCpLEsUPhWOEmC7A2QTQwBmO5kKeF050sxqgTWJzHg5qecbo2R6XNd3epcbkRyM1uqU
         ePcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788227537; x=1788832337;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HthPli1doBJ3r78ciQ2kNfx7Zf0urz5E+Lq2coHiadY=;
        b=Vc07DlfI559CpDNjGHtyJWz+GFcbaR5dKeVj6Efgx7s87AKEubZQW1M9KU0/JgtBWp
         N7WoY8vHllezEYCYYAZvJ3vBpDKHbJ8GzVS9RPDctx0ONjiwkPmZyRcwI7TAG95bem8F
         qIa2Pm9NMOhxYKFAs1QS2lEU0oW1kDo7PAGLFuLALU8olgZEy0PGONyfk0MP05Kx5SsX
         e9oopYcqdShUGrmqAMLNd1mXRisZsYtM61iPpuO7DwQWEsyrALYJAGbT1guV2E1B5Bzb
         98gNk2Avd9NQLNxbTVEHFCLkgxWll/CjIhN0V4wOvi7rT3ZqUTC8fKen3f0pZz4x29cj
         zW3Q==
X-Forwarded-Encrypted: i=1; AKwUvBxqjc+kR3RF+KyHuksr97ZS7xxqtJXgsYK2I9IXIWV4ywgBe5Jb8VQcp5bwMl3nw+eDtLiRzFo=@lists.infradead.org
X-Gm-Message-State: AFuF++kizVI5iJrVthCmUUDcR5dysFtiZ+lMV+QwDUifGWd11XyllmcN
	vZYjgn6ihiYD1XLoTrgQBQg1D29M4VXOd11JEdX6G1saMmJdfP2p09J0JrYyIxKf4QHLQLczUDd
	qeSBLtyP8J/Nu+wvv6fkq5EqFMroDbZzWQ+L/SPYm4JBKakisj67HiC+SaQWimp49
X-Gm-Gg: AYBFou1KmukCtSRPnspEy3W6+T56z2fLqnAijWAvWR5VDedwm+g6oxGtwaa5LzCNxmF
	+92N76SXfurwQK4J9ANYBN6ighLeAqAH8MKoHZiMHd8XUQ+A+Nhx0qqwUTH4h3r+BaeS9SFGgKk
	MOkWSce96kLuWJ1UMsSQb7XCxWLC2gsKeH33HCT2a8laq43A5YQ7D47H0LSRqck+HAz9fcoMxKb
	U8WZqlCcoR1OzQOBGGz+THcXVJ4Mf9o+tpIjZV2sp3oUZ1KPzQBRW05jjCmLWH5mzsFR+phn+7T
	vN6bsem+/78gtF8YZx9yOvbNxbc92D7MSjNl0hFU9EGCQMP+rAtWfXDz2zqOa2gvSV2M1lTAh8E
	MrgfQ5n9cA8oZW4dP0gczGbNuiYFG+gP+ebQnsydvOwTq9xckv2d1cz8jdQmnHlWtC+1VSEl4
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr33405058a91.21.1788227536772;
        Mon, 31 Aug 2026 18:52:16 -0700 (PDT)
X-Received: by 2002:a17:90b:184d:b0:398:9c00:29ed with SMTP id 98e67ed59e1d1-3989c003c3cmr33404983a91.21.1788227536255;
        Mon, 31 Aug 2026 18:52:16 -0700 (PDT)
Received: from [10.133.33.22] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3990bcf8079sm2709695a91.1.2026.08.31.18.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 18:52:15 -0700 (PDT)
Message-ID: <1a9f2e1d-163d-46bd-ab40-03491786b962@oss.qualcomm.com>
Date: Tue, 1 Sep 2026 09:52:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] wifi: ath12k: support calibration-variant from
 device tree
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Andrew LaMarche <andrewjlamarche@gmail.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson
 <jjohnson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Ernest Van Hoecke <ernestvanhoecke@gmail.com>
References: <20260630133001.1426824-1-andrewjlamarche@gmail.com>
 <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9e22e5ec-70b3-4ec9-ae75-295fc13a23a7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GBj-zFvjqzaTx-KXbFs-pb-zVZN6RNsj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX3aEu80Ogc7yT
 eNuwp1HWlIZKlCHcWMtHEwp2K6tUDY3SoZv2j+ZBlbFlTXvDiyx3OgOLbvQyO0m9AccxYutJcP0
 gkFJwgQQ458AmiOZtYlmpsJcGXgMyinA1szd4SXpZzCTEn4MJgNLIHa4O09T09ijiymMpoDIBh1
 A2gZRLsjwLf9Eqr6gSgphXp5+0pDon/w4TjAWfkjGLbm1s0/DD2ib3E6yqaV4XaBv6qN8cOUU4X
 gCJBmhY53MOyD6jHy1VpcOJHWJ7DhN4RL6x/BxARJCCg9lmw9lVefwJBYjvHQb2t/aFAu/bQFFT
 12pJ0U5PmOYqy6aEN+cyc9BeYcFTrd5Uwhkp34Rde3HrmBQ6zGOQaIhiUIzqWyk73RxqlWdEiX+
 0oNpoAMcqcUFb4SXQpdFU02pPEUqOQ9fYmXL7vQcXW5pZyStZL1jvh4Kl9kfbvI+cqwsMA8G1B7
 gS6K2xqQKtpOPpf97jg==
X-Proofpoint-GUID: GBj-zFvjqzaTx-KXbFs-pb-zVZN6RNsj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDAxNCBTYWx0ZWRfX+HnEXyt0Nkj5
 P/mfn7WMX9GhtKYYzyUdaYDOxTBAJiBItMB8bhZ6l+yBiAYsAF6VfTG2VACnqtdcOx+kODa4yHj
 oIVW4w6v2kRDxN1sshm5hzezwRwymh8=
X-Authority-Analysis: v=2.4 cv=d/fFDxjE c=1 sm=1 tr=0 ts=6a962fd1 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=Ggg6OIdO8VovxE8tBwMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_01,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0 spamscore=0
 phishscore=0 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010014
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_185218_198376_6F5E130D 
X-CRM114-Status: GOOD (  14.30  )
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



On 9/1/2026 4:09 AM, Jeff Johnson wrote:
> On 6/30/2026 6:30 AM, Andrew LaMarche wrote:
>> +int ath12k_core_check_dt(struct ath12k_base *ab)
>> +{
>> +	size_t max_len = sizeof(ab->qmi.target.bdf_ext);
>> +	const char *variant = NULL;
>> +	struct device_node *node;
>> +
>> +	node = ab->dev->of_node;
>> +	if (!node)
>> +		return -ENOENT;
>> +
>> +	of_property_read_string(node, "qcom,calibration-variant",
> 
> I've fixed the following in the pending branch:
>     ● checkpatch.pl: 126: CHECK: Alignment should match open parenthesis
> 
>> +			&variant);
>> +	if (!variant)
>> +		return -ENODATA;
>> +
>> +	if (strscpy(ab->qmi.target.bdf_ext, variant, max_len) < 0)
>> +		ath12k_dbg(ab, ATH12K_DBG_BOOT,
>> +				"bdf variant string is longer than the buffer can accommodate (variant: %s)\n", variant);
> 
> Also:
>     ● checkpatch.pl: 132: WARNING: line length of 121 exceeds 100 columns
>     ● checkpatch.pl: 132: CHECK: Alignment should match open parenthesis
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?id=c9d2d0d1c4a0faaba5f57e3c3350707db9f4f3f3

looks good to me.

> 
>> +
>> +	return 0;
>> +}
>> +
> 


