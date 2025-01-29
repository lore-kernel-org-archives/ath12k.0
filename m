Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9C99C0218D
	for <ath12k@archiver.kernel.org>; Wed, 29 Jan 2025 18:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sAEETuxW5lVZ2CcIMJ7LkFqNGzVvXQk3ted4/hCr4kM=; b=viohECj/kGcFUXvGTlcgWHBGyL
	zw+mElPso1Wao9cXQ1aRGHMLoUk6mcG2WzuYUNv5qI9AEt+UxVNNoO95FtEwkHcvgbBwDFxKEdR3q
	yrV3a6Vj7rDfbTm0WDe+5hWMtdwxQ5Q0Pj+3sDHffwTspqIq1egFb0P8dQiEaYnky9MvFv7aNFLoy
	J3CuyK5buP4P8T4FH1MtYP4j6D3z8JwkOrRFTOi3OPhIBNZNKpGeNyeKuppkjEH7SyoUuNgTFH2lP
	3G2ryfaTHuES09a8NQBDxhP2jQ7v1WRHxtVPP/q+EizXE2SuSfKBiRTW+YSZNzpeB3nDyPNkz+HuA
	C9ze6Y5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCrM-00000007cAb-1tfi
	for ath12k@archiver.kernel.org;
	Wed, 29 Jan 2025 18:32:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCrD-00000007c90-3KfW
	for ath12k@lists.infradead.org;
	Wed, 29 Jan 2025 18:32:19 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50T6OeUT004269;
	Wed, 29 Jan 2025 18:32:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sAEETuxW5lVZ2CcIMJ7LkFqNGzVvXQk3ted4/hCr4kM=; b=daw3hMH/i7fDSIhp
	KIjk2Wy48xcWQa7sZLR/d6fm5Wg3PupRAQglaYvKaYAtiT/PjfkKPI4IT/jWpSBF
	zKFRUrX+do/AfH5Bz5cSul/P8IsX/RacJtqpQRTiHv3MlD55hDFzSGhWWOeFdE4V
	cfFa9d1uR1DHYk/dfQ+Da9Zq6DaDfSQmBjOZcervSkRiF9G0Sn0aVP5m7HzcmPwB
	Wl5mm2L2Pyv7vLIjwKyjCnb9Wbueu4V8GQUncZTPJMLay4NB38BaJKyCh4sOEZym
	SK8AfEkNCCk4pzwmnPwY9Ra6BIIlGCyJAjEXmznEp5gO9rW1ha51lLHQ9n8q5rKR
	DON7mw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44ff1q1cpj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 18:32:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50TIW8fu006128
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 Jan 2025 18:32:08 GMT
Received: from [10.216.5.143] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 Jan
 2025 10:32:04 -0800
Message-ID: <4abbf772-8254-4892-be3c-6d7af708f459@quicinc.com>
Date: Thu, 30 Jan 2025 00:02:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 09/13] wifi: ath12k: Power up root PD
To: Krzysztof Kozlowski <krzk@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        "Sowmiya Sree
 Elavalagan" <quic_ssreeela@quicinc.com>
References: <20241210074159.2637933-1-quic_rajkbhag@quicinc.com>
 <20241210074159.2637933-10-quic_rajkbhag@quicinc.com>
 <a76fca66-70ce-4a6a-ae39-dc218d57fc83@kernel.org>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <a76fca66-70ce-4a6a-ae39-dc218d57fc83@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: wRD__r6WivKRSjwy8nO06XA99-z_Icad
X-Proofpoint-ORIG-GUID: wRD__r6WivKRSjwy8nO06XA99-z_Icad
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-29_04,2025-01-29_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=991
 impostorscore=0 mlxscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501290146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_103211_843216_4E5D5DD3 
X-CRM114-Status: GOOD (  14.42  )
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

On 12/10/2024 8:20 PM, Krzysztof Kozlowski wrote:
> On 10/12/2024 08:41, Raj Kumar Bhagat wrote:
>> +
>> +static void ath12k_ahb_unregister_rproc_notifier(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>> +
>> +	if (!ab_ahb->root_pd_notifier) {
>> +		ath12k_err(ab, "Rproc notifier not registered\n");
>> +		return;
>> +	}
>> +
>> +	qcom_unregister_ssr_notifier(ab_ahb->root_pd_notifier,
>> +				     &ab_ahb->root_pd_nb);
>> +}
>> +
>> +static int ath12k_ahb_get_rproc(struct ath12k_base *ab)
>> +{
>> +	struct ath12k_ahb *ab_ahb = ath12k_ab_to_ahb(ab);
>> +	struct device *dev = ab->dev;
>> +	struct rproc *prproc;
>> +	phandle rproc_phandle;
>> +
>> +	if (of_property_read_u32(dev->of_node, "qcom,rproc", &rproc_phandle)) {
> 
> You are not supposed to read phandles as numbers but use proper phandle
> parsing API. See of.h, e.g. of_parse_phandle.
> 

will use of_parse_phandle() in next version.

>> +		ath12k_err(ab, "failed to get q6_rproc handle\n");
>> +		return -ENOENT;
>> +	}
>> +
>> +	prproc = rproc_get_by_phandle(rproc_phandle);
>> +	if (!prproc) {
>> +		ath12k_err(ab, "failed to get rproc\n");
> 
> This is supposed to be dev_err_probe. Lack of handling deferred probes
> and resulting dmesg flood is all over your code. You need to start
> supporting defer.
> 

Sure, will use dev_err_probe() in next version for all applicable probe error log.

>> +		return -EINVAL;
>> +	}
>> +	ab_ahb->tgt_rproc = prproc;
>> +
>> +	return 0;
>> +}
> 
> 
> 
> 
> Best regards,
> Krzysztof


