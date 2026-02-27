Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F82FD7F91
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ett7mpf0ScG6POdwVZ0VVIp2V5X3Jkol2pRvXyiOqdU=; b=f8XyYXAvK+WKwejFrQe138YfVS
	UC1ZwIPFc1M9QRSDHfkJ6HUvSEaiDJMn7VvSyYQ0efeIiB2k36qDdjR08sXOdowrndSPLJYXjqPvl
	OhbYhi4RvGWxLWJut/H74ZIp+0VF6RqzlHr4pajURXyijbPM6kSYiHM4XVxtgaEBVOrYGcCBn7l/m
	NTEdEh9r5nXu+ZxcGiLR02BXLkhTwuF/TiJAU043yxiifwuyoozEKH2LFB8YwupuYNorsovqtJy++
	T/leXY+1+ntqhSzbEO850OjAkijcv2vVv7IBuy4KMm07ZTs4tDoeXDsRM/3y5nr3d2V9ZoUNeijfx
	nmhk49og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv8o-00000008Emr-1cwV;
	Fri, 27 Feb 2026 10:32:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv8l-00000008EmS-2N8m
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:32:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9uTMI235881
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ett7mpf0ScG6POdwVZ0VVIp2V5X3Jkol2pRvXyiOqdU=; b=ddqeO0BtSAW6EC8n
	CqlUBG1WL6bVuEk/zrIPCwNiNWX7JlKshPldYJ8MZUyHQv42TIKENJv1h7/kgV0t
	vrRXX2u17iVW/xLivRdnQzqSgcmHULzlKZRps6wLyHI4ng5c9bBSwTbYhwsfLHah
	JOU2Y2SfsxMbz78HYAKbLbCCU1qJvQPn1gI3zCs02MTd34LZIV4cnS9hhXhmSedA
	hxElM0RFoXBR5LJqfObU51nJvAiFV+pFjWIRnbTVXCuk5DsMmUEDSveEbIgvIsVg
	U3F5bO1m2OeF5pwKQv3xXejqoJRE9A5kRm61iqDG6n5TF41s6YHanu1jtOmL+1Be
	q6qefQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjx1xt4uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:32:09 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aaf2f3bef6so19085005ad.0
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188329; x=1772793129; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ett7mpf0ScG6POdwVZ0VVIp2V5X3Jkol2pRvXyiOqdU=;
        b=Xpq9lL/ZVo2YaG19StVLvSoRP5hmY+8q+cmUrdYXPMwTVvDvgL2K7GVLg+Kuks14Zt
         JleMMTbtuYkalcPKRscyLTUZhIMjM7aTgIU6JQ+lp0oPWXqLM3WSqPy/UkGHBESqv/ha
         frxpmGQ+pYjXTyOtQmKxYj9wS3UCBYxq3fbvMEAisC1hlNHvaAGUqA+mjfASsLhcp7ut
         Y4x038G+ElNiyMgW7admKq+9LKQogMfgSm64R+UppyEkOM7zirn2rpm2vYKuyj/qt9EW
         +mMRuBZ500VPZqSv1YhBFuvsk3Uerw0sNgO3NkVyPRnYtFly9JsDuQgzzPqilptOrOAa
         aYPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188329; x=1772793129;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ett7mpf0ScG6POdwVZ0VVIp2V5X3Jkol2pRvXyiOqdU=;
        b=h3+7ypVCgaFZ0C4dOHocl503n70qS/KYGtZYzjH8N5TziJ91/UjOVuud3zHc7bw2cu
         HL4bVNu4VrwxiCJU2FxAJahg4gNbfqzQmov66oEpmtlPRnANUoeEIIvYkfapPCIdZvOw
         yC/w1/98HCSzhesfB9UR+SuuNNplCGFraVuI8BhwFyMWEYi94RuOI0ocg8WupZZq03wE
         xl0vPJT5IWGppmE9u0PFvQcaB0sjbSmHl8cIymoyV1aJVypTT4DyKUzwKjs+ahXrX4fG
         btkp1vdn5nEHrH4V0/g7pwauO1qPqhHanDVVxc9wFdLbjO2KUf3GnACSkHvESQPF/O1u
         nD1w==
X-Forwarded-Encrypted: i=1; AJvYcCW5/dmOdB84Mp1p0w316F3JFI3VJgpyqvc/paDeb1TvUPrgbFQ73h/J7gaGUx+ggTLkLd2q94Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz04gVcYZCvp0+ohMN5iLJT/bn2AUcvOFb4uDz/UC4CZ42t6XDq
	uCvU/079SmX8eqQDb9MbCa3fKyzKkNVn1itN6bB+1Niig/SG9Q5qNH5K2/ktv20bA5swg7+RFak
	fP7pO8OamM3mbDPMBS0edpdwlhU+6B+K5WsicFmKRNsB+HM5nWsDpL77BvEXhjF4yXHJ04p8v
X-Gm-Gg: ATEYQzzdA8A/qWOaqZTKTbEodvkY8wFfpFItF1ttbRgKdtiYxKhjjH5d6ls+X/tv1D3
	gBvUkoPNmwQ0TYJZexEoyEcPH0SutHe5m2jqLb3F/y1PKwydFTmbZS+XATn+Ia7/xGThlDL/3aU
	8Vpmz/CVc+ijrVm1MMeGdk6m0maFkCEk7AkfRCqiwBVBKGm2hbZPV8s2TDR1DOozhjO8cTbF3fl
	lUfcb16NdqFTLMqR5lgOkZjpPLC9Vz6nqRH2mWlizTrWaHOIVusYiCC+pgEKFOB/1N2xSFVAHDG
	sSgPZTWU7IdJ0dv10GE2R4CLKHfaEx9KjXFV1WD6CbAHXDaMPCZwSgeqXGXUPiY6126bd5k6XWH
	ECf91TBVYpehhl3v39NwUhu0MbaPUqlJwBN/HCXsz0v2A+Az6J0vMHAVkuX7SBb53318=
X-Received: by 2002:a17:903:3c6d:b0:2aa:ea8e:f118 with SMTP id d9443c01a7336-2ae2e3e6adamr24501735ad.3.1772188328730;
        Fri, 27 Feb 2026 02:32:08 -0800 (PST)
X-Received: by 2002:a17:903:3c6d:b0:2aa:ea8e:f118 with SMTP id d9443c01a7336-2ae2e3e6adamr24501435ad.3.1772188328227;
        Fri, 27 Feb 2026 02:32:08 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6b4177sm53062265ad.62.2026.02.27.02.32.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:32:07 -0800 (PST)
Message-ID: <3721094c-17c9-4eeb-a4c6-bd1cc7c44a75@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:02:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Remove the unused argument from
 the Rx data path
To: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260227042128.3494167-1-karthikeyan.periyasamy@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: GRWfQj4AnZ0EWaQGORwqdZkok06xLQ4V
X-Authority-Analysis: v=2.4 cv=Vtouwu2n c=1 sm=1 tr=0 ts=69a172a9 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=LVef6NQiuxLdmPMVh7EA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfX8/n3LJ+2aDup
 OrlM987emtD2PZOf5kGdRL6rra7nLZu8wahEI/iP1PIzSaSyR+6TTLwRPFOMtQDtmWDpl/erbpA
 Vc2ANfHUUTmT/TP2qoWuOJN9bMgQWYsvb1/N6EyrwnKtUA3RGI38lrJ/MOTZ1QbtM0stLYDDpLm
 oGG4tTCKnhQqio3j5PzeXqfie4KGnDe92BWtWyq6T9tfsSwasfS2Q0t8umvqteiVfkXpIW9uB/9
 c2TUBbCP2BjB5B50gbNqM7ywCL5tL0ZlbPFL8aOAW9l1cGog7egij1xzrp5CjskfOukvFgbYqJV
 nx2wRxBq3s0f6XMTEMMVI4Arq1pwTb5ZFw0Hu874wO5wlXy+//5ZZLmHtWdVFNVcRNb8b920SwJ
 R5uWworv2m1/dmrf0974TmHYWJzyj6ZOC1fLEIwSyurV3UUHk05CZwLu7MGTSbc+F/iPMetoi4m
 bKyNn5R/Q/d8yr2VwhA==
X-Proofpoint-GUID: GRWfQj4AnZ0EWaQGORwqdZkok06xLQ4V
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 bulkscore=0 spamscore=0
 impostorscore=0 suspectscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023211_612937_142F24A2 
X-CRM114-Status: UNSURE (   8.49  )
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



On 2/27/2026 9:51 AM, Karthikeyan Periyasamy wrote:
> Currently, the Rx path uses new infrastructure to extract the required HAL
> parameters. Consequently, the HAL Rx descriptor argument is no longer
> needed in the following helper functions. Remove the unused argument from
> the following helper functions.
> 
> ath12k_dp_rx_h_undecap()
> ath12k_dp_rx_check_nwifi_hdr_len_valid()
> ath12k_wifi7_dp_rx_h_mpdu()
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <karthikeyan.periyasamy@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

