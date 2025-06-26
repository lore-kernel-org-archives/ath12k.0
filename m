Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96EACC7EE31
	for <ath12k@archiver.kernel.org>; Thu, 26 Jun 2025 19:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7hJht9qqs/t1dfOac3Sy9XDpNOgvAdeh4EY5QG98y/A=; b=u7uoBzR9ZxiZc+tKI5S1c6Y8yZ
	HBhcIlQYWofjDVOydyc7qTWwfCw//2gTKO4jke/gAHsy3KMxJsAj2SsZYrYC05Wtqz4spQjfcOUS9
	DyS3BTfiT7ws+HkySHepNgG5DV70V6luZLp2eydjOVz+vIMVEfaxo5QCVQnL9hQzGerDQY/wGoQbu
	P93Y+anl98xQE8dyVW+TnDXE5BlaCCICpbfGLmdwbz+xTcLEXZWgXhvJRftM8svc9tTOnIi0OMscd
	dyEgqOPOM2HKALF7BvDCs2wPx96EOYISFB9fzEeYq8dxdz3SLzgzhst32K0zwytZtTKucEoWWyu04
	G7eNAE3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUrr7-0000000CX0f-1ZTU;
	Thu, 26 Jun 2025 19:01:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUro5-0000000CWZs-0Kkh
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 18:58:46 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55Q9xVcd014018
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:58:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7hJht9qqs/t1dfOac3Sy9XDpNOgvAdeh4EY5QG98y/A=; b=X3Tes+CGqQWmFtT7
	5hOdCxboUR1VeVdtBX6kSb8slndGCh0idFv6jn2ebzaJUziNHR+WnqaK2zc82Z+A
	s+Kb66StomnwVZ8sJIQ+J32mNAVdzprQ/fXZaMB6Tsq4Vr9M3t6SHKg4n+KOc0CS
	dtVyqrCV3l1HIsL8kxleI/blIoENoJP81DR9jBzJ5qHlghvHmrLiqGPEuVrL99Cq
	zXkKqs4/q5/pWPpP74xhMncwb0QSjtt28eFRHFFo0x8i5uhOkSO4/2PqaN74zM67
	ysZQdoQEIIi0kqNoy7mLAC+s8fF93H1y48Ixq9Qojgbzksju7ah2WVZbFBNtb49/
	tX0J6w==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgmba7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 18:58:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74943a7cd9aso1865031b3a.3
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 11:58:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750964322; x=1751569122;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7hJht9qqs/t1dfOac3Sy9XDpNOgvAdeh4EY5QG98y/A=;
        b=BYG5zFRSj8XeiMhIgoC+HCmPbA2saqo9EeEG3VTf3PVQ5nsH5XQ13T6wdMdXP30BAG
         ewFhT1swmg2iPhrPgOHKYQhPAelxWu0HvaLY5f1FTWjoy/nGzUr4Oy1WNa9IVT2GsEjW
         1pouNbFN5W7v4CEF8S58thvFaiNECXw4LjoxbnJV4JKIdE+0lSUEJcCKg9gtqnn07DWf
         w9AMSWskkvapjQx5KXy36i/lzdmHM4z6ZWRaStxH8kmrh5pMZ87k1EZP+cN1wiIcyV+j
         xQoGYUWvGyFveY3d2nRGPlYPwQW125bFUTyDZAb3VXHl9o0N4dlAn0n31T2l24M0m52B
         3cXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgwHxCt8JgGIXdgkBv70XUINyvmim9qbAhxHkDvHqMLZWEZmCe3JZ41UGrr0Y0jge/1eSGq9Y=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzmk0PR/LgmAyGstB/+vEDb8xnOWY/lZyLTkMfRfh+OBI/Yak6x
	t0ZY8hlPp4k5zNfQLob5K6ZQ6rquEi0XAJCbeCHQVLD5wQK/vPmEN3Wn6T7ieolG81Ax1KfzV5L
	HBLk4lP0B1EWI6MwXlTF30BaPc/XTP04U/Bxuny4c+MecTjR8b17RRW9IIwlRzxCyVcglsJlI
X-Gm-Gg: ASbGncuhoXviVkf1risWabakOanevC8doxF459ZCGtPlBmS8dZD21pVx1ebSHyyo1Yt
	1KHWbfDm+hf4pU9XJINO6acVyMR35Gz0pU7B0P/Q4b2XxIx9Dl/e+/wIhob3ja24TJ2bXkSkzWl
	4bzhrMOGvAFD/kGaNjPtr0aR7aVqTOVeE29LoV+A1S/TrhL8sdhp4rzlCasnRPzp4t4+chjce3q
	+mSGZ3ChwgS7djS5vsRyHz4uPZ+tVJOu9H7Q1xPqEqk4vZssMFy1WJ25wq8zbouv13MqBlUmtQm
	10oqZ9gVUPQcd9XMveUP1SdShMd66G1UVQg1zEjbqnzolSrAA02KaoHG8CiC40j+lSKZkfDlMb5
	CsdzVAPFLx5DS+k4=
X-Received: by 2002:a05:6a00:1953:b0:74a:d1ac:dd48 with SMTP id d2e1a72fcca58-74af6f80730mr387238b3a.23.1750964322452;
        Thu, 26 Jun 2025 11:58:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpWGVmELkxpW1iTyTYKIQf1aGEee7mw03kIFkPSPspVzPwV+zLb41R8LUxKIjLtkEmuP+a/w==
X-Received: by 2002:a05:6a00:1953:b0:74a:d1ac:dd48 with SMTP id d2e1a72fcca58-74af6f80730mr387212b3a.23.1750964322049;
        Thu, 26 Jun 2025 11:58:42 -0700 (PDT)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5574604sm359024b3a.86.2025.06.26.11.58.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 11:58:41 -0700 (PDT)
Message-ID: <a8d8b59e-70b1-48e1-8c63-b641a8c9ca86@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 11:58:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 2/2] wifi: ath12k: Add support to RTT stats
To: Roopni Devanathan <quic_rdevanat@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <quic_mkenna@quicinc.com>
References: <20250617051136.264193-1-quic_rdevanat@quicinc.com>
 <20250617051136.264193-3-quic_rdevanat@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250617051136.264193-3-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: j2wEsmiozgSZin-uNnXHXqF_DAWTEPkG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDE2MSBTYWx0ZWRfXx1rZEEItl1yV
 +1pQ9rPRHEuzcrOZj8CI+zKoTB0FktBcNj374XEtzGASamHdKnYwjGvSbFPocAqRI8fw2gvEnPb
 hWxSgWGK2sSsN+mkv223XVLklJV4d2KYeCU5R2Bzab73qKX19kZRY7A3UXyGuufYbQtlYsi+B/g
 /ey0WxaJqcTm+7PMshMoHKiHlSdJ9bNGN9DmhCuQBbZb6F3zy6SygqhfxrrrXtSBcVCbtwiAApH
 kon7HK6ywhtO7SYIa2NrvDnoRSeLGlPjP8/CS59xTpWAHc8RDsgg9GBZnjqtUNzdOInnmGT4Boi
 tyVVTAPdMfaRqd/2aPTXTmKwkc3va85NmHvddkiq1m5sCT91rAuimAaTpVaynGoFSkfLR70q6ss
 joRJ0CKw6oFrWTokfU6Qyo2IxVRfoE8PzYPBzgNYS3ViTzEaKe8StNTrqHW5U+RggFJe50mg
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685d9863 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=e70TP3dOR9hTogukJ0528Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EHGo9OVjQ_Ov5pHEzq0A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: j2wEsmiozgSZin-uNnXHXqF_DAWTEPkG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=841 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_115845_236016_B78C0177 
X-CRM114-Status: UNSURE (   8.25  )
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

On 6/16/2025 10:11 PM, Roopni Devanathan wrote:
...
> +enum ath12k_htt_stats_txsend_ftype_t {

I'm going to drop the trailing _t since that is normally used to designate a
typedef

> +	ATH12K_HTT_FTYPE_TF_POLL,
> +	ATH12K_HTT_FTYPE_TF_SOUND,
> +	ATH12K_HTT_FTYPE_TBR_NDPA,
> +	ATH12K_HTT_FTYPE_TBR_NDP,
> +	ATH12K_HTT_FTYPE_TBR_LMR,
> +	ATH12K_HTT_FTYPE_TF_RPRT,
> +	ATH12K_HTT_FTYPE_MAX
> +};


