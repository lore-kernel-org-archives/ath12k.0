Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD9F9C02192
	for <ath12k@archiver.kernel.org>; Fri,  7 Feb 2025 05:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dOzuZc8iVwPZwJIc+/M02cfHSRfQBgPrYnVNLWwSnf0=; b=5BeUhQvnSA42ML+mVdlOqKiDkr
	9prWk+S0OndWWOtYoNxjvBQc8++Nlpn4Vaa14XNIVfrRVrdGi1LO5av8iwXxOrLU0J1RGp75SWfUv
	cTgIW8K/YYgQFAtqfPxFY3CXyJlSvb9gK8kX/8bxHhupWTEfUqGhBEPhWgud/AjF3rgIzFPeHAoAC
	wVHpqNqlLPj/B4wIrYjeymayUIdsoxbJqONGVURADrrXZcX5Iquix5fNAh/fXT4/E+PLJunAc0hi7
	fyXwBReycEtTcwCLZmw8nWzYTHk2FpsRNJJO67U7ArF8f/BmJSdPJE6WN/ddJ561/VbRAV6b0t2IR
	u+ZQwbzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGTb-00000008KpZ-1xNv
	for ath12k@archiver.kernel.org;
	Fri, 07 Feb 2025 05:00:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgGTY-00000008Koi-3PhH
	for ath12k@lists.infradead.org;
	Fri, 07 Feb 2025 05:00:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5172JVNd004869
	for <ath12k@lists.infradead.org>; Fri, 7 Feb 2025 05:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dOzuZc8iVwPZwJIc+/M02cfHSRfQBgPrYnVNLWwSnf0=; b=M1jSB7qBk5goec8T
	GQOcg7Pu8iGbWO9nu5LL28stvOG/BdilMv5LDkp/GtCTnxQwQHvVNRQUhmb72Oor
	TVjjzgbL9CwccGcAIzla52NZ8oVTozF0CiXX9op6qtdEHXBr/5cmA3tKh91Sr3RC
	87rvCAHpCplJ1tM/2gOwc6HCwq4vZd6CuCfHMyaaib/jMhbtj4OBoEpa0cEqorc1
	AASeeXXsYQ0eg1Erps9Q/wQK7LSwu8IKjJAiRZ09OotZOtR7cLFEcMLfsBPyGzJN
	c3A2/Db36NU4Mv8HLG+jH5goSOj5002TkNoFrQTMtiAQCTTbJzDt/n/irpy4P/BQ
	rG6C6A==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44n99e8aag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 07 Feb 2025 05:00:22 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-216311faa51so33178885ad.0
        for <ath12k@lists.infradead.org>; Thu, 06 Feb 2025 21:00:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738904410; x=1739509210;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=dOzuZc8iVwPZwJIc+/M02cfHSRfQBgPrYnVNLWwSnf0=;
        b=oSBydRjgkWJ9yRBv7jGEXDb+1mn16za7RV2U8OM9U8KF2yObLhtK98Wsq0/2B0nia6
         Jkl9M3urLfa4KlmEP9HLJHQHtXBQ7iSP2554x4pe6qj42ztXm5Mgibq67JKT9MEXX5dm
         Ze1o7BY6iq4XEBlSzFxj+VbHbNutpcVoBihsVrhEdsDLvnKC+YQXfHjUVWfi3fdgUISm
         tHhsT/dK//L9ai1V9trifY9jl7lTbQbSeHHLeR+/SXDdv7atGEIjL2dVliP+p6wFsxFq
         kJjB1yDXHL1ieZByLUWZqM0OUpG1iJCo8SJcr2BS1Z2HtWQdf2RbsXIqaucM2wqT3GtS
         DPpg==
X-Forwarded-Encrypted: i=1; AJvYcCW/dg21YV9EKtEfFBppXlOvRZsjSRRfgfyk85ly5kxrLanU9r1dbTImT0gOD8CN2G02fH/K54k=@lists.infradead.org
X-Gm-Message-State: AOJu0YxxQxEmfGT0rNtV1IsJ6ED/wfz1XI4IdXB/pIPsld4elavNBsYP
	2trf1wPyK/rs1ec2gGA8gcbA/VknQFeBLA51X9gjsWK3KGwAvd9nZrExjxSadP5qAsjGiR45vq0
	TUNHViqc2J/WAd4EBnHqHRZ2Vx9iqcqB7v1jvU+lsx5StUfVp3G3HcbedLZ6l
X-Gm-Gg: ASbGncuVpA4PMqgqk05Qr6Z1ISnqBKeHkXdmxqZavvZwjfOgZeZ46PmhSCXRWA4by+p
	XBr11TMtotFDwcSWhPOwYjQuJ/3RYGlcCWoZVp5cBlHTIepn6wfGjs47tTmfEIv8NwyN6hYUSKq
	C855Pu24Wt+w2LApvpDdh3JGaab57yJK9tq7aGcT8GWzee4LkZB1KqTxaR/EFBKr1KxXDdCQwj8
	4TiTuzhaLCYSfaThkhSM7+xTEC7NKCqmP2hn+bE1sgFRrllVoycl3eW23f1RxA5929Ji5xwHUN0
	sTIF2PTaeqLdwA3wclX0se1HNqH6GOR96t5qqWY=
X-Received: by 2002:a17:902:cec3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f2f1376c8mr95105095ad.1.1738904410210;
        Thu, 06 Feb 2025 21:00:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG3I8kg0/wWJ9yAjmoEI9x+DgbR4cjYovakozwhpNH6aeEU/frAxeCztnalGWo2qYLs4bvgig==
X-Received: by 2002:a17:902:cec3:b0:216:4122:ab3a with SMTP id d9443c01a7336-21f2f1376c8mr95104675ad.1.1738904409767;
        Thu, 06 Feb 2025 21:00:09 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f36552068sm21477785ad.87.2025.02.06.21.00.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Feb 2025 21:00:09 -0800 (PST)
Message-ID: <4df3ce01-64f3-4115-be6d-c84160b8dbed@oss.qualcomm.com>
Date: Fri, 7 Feb 2025 10:30:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: Fix locking in error paths
To: Bart Van Assche <bvanassche@acm.org>, Kalle Valo <kvalo@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20250206221317.3845663-1-bvanassche@acm.org>
Content-Language: en-US
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
In-Reply-To: <20250206221317.3845663-1-bvanassche@acm.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: zdk4gbF_Mac94IaSsytB6imCpkO_dJAE
X-Proofpoint-GUID: zdk4gbF_Mac94IaSsytB6imCpkO_dJAE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-07_02,2025-02-07_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 mlxscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 phishscore=0 adultscore=0 mlxlogscore=818 malwarescore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502070038
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_210024_975452_641DE660 
X-CRM114-Status: UNSURE (   9.88  )
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

On 2/7/25 03:43, Bart Van Assche wrote:
> If ag->mutex has been locked, unlock it before returning. If it has not
> been locked, do not unlock it before returning. These bugs have been
> detected by the Clang thread-safety analyzer.
> 
> Cc: Karthikeyan Periyasamy<quic_periyasa@quicinc.com>
> Cc: Jeff Johnson<jeff.johnson@oss.qualcomm.com>
> Fixes: ee146e11b4d9 ("wifi: ath12k: refactor core start based on hardware group")
> Signed-off-by: Bart Van Assche<bvanassche@acm.org>
> ---

Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>


-- 
Aditya

