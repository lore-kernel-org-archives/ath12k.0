Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 050B8C02194
	for <ath12k@archiver.kernel.org>; Mon,  3 Feb 2025 14:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SAVn8olU3KNdR11Q8xavIGnX0m9TWIy2i+F3+DqAvuc=; b=UhFMXiiyPjI9pX0J+do4Oo49+Z
	8+v/b69aAkEDuRlfO/QjKSje6BX0J0rZuqBeKxcNJMHZl4hGr9XQYbLt7APi3nT9pusTbbNlBqyqI
	ifIJgd2VEjHSBXS8jj36wzGzYv8zAyW//rUD4UqfunOVg2eMvNqtaqiBaUYca+TLY4Rp5IjhYmItC
	8Ebh9jeatgPgaloVT39tZ1q/tG3tgIsWSG6tAOxu69+VdKdCxSRipE4oZ22BRHY3X1cMA+kM06xVO
	Pm1tIHITBY5Ye0nLEHI66HFNQODZ6EGGMvxUdRAl1Mpzz+S4WNL0XBVmIu0Pps6MdW8am+8PUnDL4
	HaBJzoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tex5N-0000000Fc3x-3FrG
	for ath12k@archiver.kernel.org;
	Mon, 03 Feb 2025 14:06:01 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tex4k-0000000FbwN-1vnu
	for ath12k@lists.infradead.org;
	Mon, 03 Feb 2025 14:05:23 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 513BEXX4002323
	for <ath12k@lists.infradead.org>; Mon, 3 Feb 2025 14:05:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SAVn8olU3KNdR11Q8xavIGnX0m9TWIy2i+F3+DqAvuc=; b=LKQEsPpMCvWTpCkn
	C5MMQqEU2PPLyPGS7lV/7Q3GtokmRMzhE5/sLuBTXhY/ggerBlTPFJsDkXmYjgq6
	vo/YUy8/YtkXzLEWhQDiSOqE90rbku/ga5a+oX8VJmM7otILx/hUTOJuBgAohFY8
	4IvvKYOpEkvgBm3Lo6sIILrXyM6kBkJi0KcGe7URfGQUBsShGtl2otJ0LuGFikcy
	pX1R4slNaSTWnUMsYI8bDEIgB8mOdDc0a4xYy3Pwg9UHIqHyGXmkZy9rk/O9/6jI
	qvu6WAqOycQzjelFgAkNEBcQ7wU4BS+NyfheOwjiPRBWOIW2oXm/LnaA+ZuzQPgq
	LnFhKA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jvrkgj6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 14:05:21 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6f28dc247so87681985a.3
        for <ath12k@lists.infradead.org>; Mon, 03 Feb 2025 06:05:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738591520; x=1739196320;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SAVn8olU3KNdR11Q8xavIGnX0m9TWIy2i+F3+DqAvuc=;
        b=k+3vCuKU8QVv+2WpAjL7pZ9PHnRJ72P4PfcZrk8y9mE9/0XxPRr334E/zpsaZsiUDd
         vn1U7GHI9xrTHcpqp+bCAp8ujyw4tI68/jsTzQtt9qAY5K4Nv3c/TqZwXeV7bOnzBZYT
         RpT+nEhYbbmdEtMBbYNheD01K7S3thrOrQSJPG0dHGSUVpGrEq04M4JCXoJiLXRRFTTp
         tAl3dDE8z/ipYTqLLQL3fEjVUCxGX61PhrBrcgJJ2JGuqLapcg2uQsKerjq0e3TTMB7Q
         J9DQnwx5mikuPv1cbl/G6IqnZq2cRh177wXYwdPh7ob8yrmk7Tu+1Km+cVYSAcudOR5D
         ge6g==
X-Forwarded-Encrypted: i=1; AJvYcCVFP1b3z6pVFsLQwf7cgrdBbGuyAsqM0b3cPG4TFw8DdL+5MJmnRR/x2DmOA5oLnyb8ggsuRSU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxZJxD4wt2gDqSxLu3iLh4V6qLgPyJzjP0VVc/0GjpjrG7GnxKX
	J/+W1o8YMkC2/tVrPKzLeje27hYyNzwKmEjBp87yLoPsg3PrMcDblZKOoMe4SygqepJLA9XCtRx
	YREhiMmUp/8hHwne0l2V4IMT54ih/i7GkyV/EgNJ3bNMz08wLs02qEtAettLK
X-Gm-Gg: ASbGnctCek3nx+Gt0VAdpaK7N1pd/5tMKFyzNhwDbrwVtMlVmJ5lnuQWieIp859rWt5
	005Cs8RN+jD6vJ3Eubilntp4ycA6oG1vfPMFe09jo3SbcqjhTxkfbgHbXjtv9BTvSlC9iHIIyiL
	SjsuUAKYB4ZbyfMQgOvcCe8koy7Xrma5cT9nqPCNUQ5f+Y5LDWFQP1p+yrdp/nRjgnT9/2+xcHw
	bPcj2TntdJUmLdd1OCKRuzbejQvwxEeJ3/sF9N8jiT/G/gm65MQlDWLZRrX128uZP5Tgh50lm1F
	osmuXx18Dxxj2XrnSzJrDBDxJAjSm98rjQVy4MwP/U/W/Hm85Mp6PxPG62w=
X-Received: by 2002:a05:620a:40ce:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7bffcc352a0mr1170512985a.0.1738591520419;
        Mon, 03 Feb 2025 06:05:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHcEhI9vXikoPJbicfHzVgVexvWitCJUXqJTFDjSt+WZfBiMjT0/ZAvjU0/DTx1rj1mX1GJHA==
X-Received: by 2002:a05:620a:40ce:b0:7b6:d2ca:15b6 with SMTP id af79cd13be357-7bffcc352a0mr1170511085a.0.1738591519966;
        Mon, 03 Feb 2025 06:05:19 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc723e9fe4sm7781445a12.26.2025.02.03.06.05.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Feb 2025 06:05:19 -0800 (PST)
Message-ID: <e037cad2-1462-4be7-81bb-5c41c346f765@oss.qualcomm.com>
Date: Mon, 3 Feb 2025 15:05:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: qcom: add wifi node for IPQ5332 based
 RDP441
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org
References: <20250130045900.1903927-1-quic_rajkbhag@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250130045900.1903927-1-quic_rajkbhag@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: RgZ3puVhf7G213_2Dgy2CMo4OGSg9d2H
X-Proofpoint-GUID: RgZ3puVhf7G213_2Dgy2CMo4OGSg9d2H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_06,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 malwarescore=0 bulkscore=0 clxscore=1015 mlxscore=0
 adultscore=0 impostorscore=0 suspectscore=0 mlxlogscore=959
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030104
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_060522_509787_1244A484 
X-CRM114-Status: GOOD (  14.25  )
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

On 30.01.2025 5:59 AM, Raj Kumar Bhagat wrote:
> RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
> device.
> 
> Describe and add WiFi node for RDP441. Also, reserve the memory
> required by IPQ5332 firmware.
> 
> Depends-On: [PATCH V2 0/2] mailbox: tmel-qmp: Introduce QCOM TMEL QMP mailbox driver
> Depends-On: [PATCH V3 0/8] Add new driver for WCSS secure PIL loading
> Link: https://lore.kernel.org/lkml/20241231054900.2144961-1-quic_srichara@quicinc.com/
> Link: https://lore.kernel.org/lkml/20250107101647.2087358-1-quic_gokulsri@quicinc.com/
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---

[...]

>  / {
>  	model = "Qualcomm Technologies, Inc. IPQ5332 MI01.2";
>  	compatible = "qcom,ipq5332-ap-mi01.2", "qcom,ipq5332";
> +
> +	/*                 Default Profile
> +	 * +============+==============+=====================+
> +	 * |            |              |                     |
> +	 * | Region     | Start Offset |       Size          |
> +	 * |            |              |                     |
> +	 * +------------+--------------+---------------------+
> +	 * |            |              |                     |
> +	 * |            |              |                     |
> +	 * |            |              |                     |
> +	 * | WLAN Q6    |  0x4A900000  |       43MB          |
> +	 * |            |              |                     |
> +	 * |            |              |                     |
> +	 * +------------+--------------+---------------------+
> +	 * | M3 Dump    |  0x4D400000  |       1MB           |
> +	 * +------------+--------------+---------------------+
> +	 * | Q6 caldb   |  0x4D500000  |       5MB           |
> +	 * +------------+--------------+---------------------+
> +	 * | MLO        |  0x4DB00000  |       18MB          |
> +	 * +============+==============+=====================+
> +	 * |                                                 |
> +	 * |                                                 |
> +	 * |                                                 |
> +	 * |            Rest of memory for Linux             |
> +	 * |                                                 |
> +	 * |                                                 |
> +	 * |                                                 |
> +	 * +=================================================+
> +	 */

I'm still not super on board with this graph, since this is a very predictable
layout where there's [something for firmware, contiguous] and [free]

Konrad

