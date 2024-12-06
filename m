Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FB0DE77173
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6SfTzBF4ioa1KXYZxhAGGE+Q7GnLFbiH24b6nL2Vh0=; b=BT2qpyNOqsxHBxxMHcOnnq9U+W
	/Auhp9Q64+pgnqyYnlJf9Ma1JWiSvHftHltEIg3GemL79i8joXT5eHcp2CJdWo6QrZQpSycQLdd0l
	XtUkYp1yAt/3ppxRj+5eEaDZvVDQLehk4/C+wXjn9RE2jWdDjgWPHa0Eu/GwpUd1Ad9d93BdnJXTe
	dgaRUTMMLH7gO80SkLYF/TR3VPVahbwFZtnBfMUEExcv/V+L+mg0fV0VH8RckzLp9JPSd+TE+e7Sj
	HZAqK+XuiFgBo/bAxEaq0b29m0+nW6iqi+PDFiQi9SKju3N2h/Z9aE0hCncspf4NyjKCOXHlPYeO4
	hG0Dzucw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV8K-00000001B9M-3yLs
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 10:00:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJV8H-00000001B8P-3J3o
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 10:00:22 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B69SWEv016321;
	Fri, 6 Dec 2024 10:00:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/6SfTzBF4ioa1KXYZxhAGGE+Q7GnLFbiH24b6nL2Vh0=; b=k+S5l4Clh3nk8mVI
	AZz7QyKC4WlFI8aLx8ZVi9X+wYCSI6wMzYUGyHVcu3836aiRui3G+mIhWygRnddH
	DSxA00nMQAYqmWNGcogxMY3roxkFKqw2RazpjthO0GTmg8ZNlHSaUXi4XEFnjGBk
	R+jIF8jjWdAY3isjqfe1ImPJv8JVcyBLnI97vG1uEUPLbwdTV2qw0KxxihLL4h4l
	9SaqEdBG3g3q6qFRCfIeO2llb2BT/owQMdLPzO8VDdSHqf+pR0uvcA0Y3K/M45l7
	fXelvJBXvuVdYfeewC3EXjgS4vFLBNhq44Io+IOnnXcx4clR52ts4rWAc3u4gO/b
	Ookx2A==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43bxny8318-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 10:00:16 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6A0FdX029894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 10:00:15 GMT
Received: from [10.151.41.184] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 6 Dec 2024
 02:00:10 -0800
Message-ID: <9f8b86fa-65d1-45ef-b363-54772e2c48ba@quicinc.com>
Date: Fri, 6 Dec 2024 15:30:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 17/22] wifi: ath12k: add AHB driver support for IPQ5332
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Balamurugan S <quic_bselvara@quicinc.com>,
        "P Praneesh" <quic_ppranees@quicinc.com>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-18-quic_rajkbhag@quicinc.com>
 <243cd21d-6a35-4ff0-9b38-ec519a804670@oss.qualcomm.com>
Content-Language: en-US
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <243cd21d-6a35-4ff0-9b38-ec519a804670@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: J_6rJBf7e5pZnwX8FryHlP9jpdrd-0P1
X-Proofpoint-ORIG-GUID: J_6rJBf7e5pZnwX8FryHlP9jpdrd-0P1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=916 malwarescore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_020021_943504_EDF382A8 
X-CRM114-Status: UNSURE (   7.77  )
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

On 10/19/2024 1:59 AM, Konrad Dybcio wrote:
>> +static int ath12k_ahb_start(struct ath12k_base *ab)
>> +{
>> +	ath12k_ahb_ce_irqs_enable(ab);
>> +	ath12k_ce_rx_post_buf(ab);
>> +
>> +	return 0;
>> +}
> Neither this nor ath12k_pci returns anything useful - perhaps make this void?

Thanks for the comment, this requires changes to be done also in ath12k pci and
hif_ops, hence, will take is up separately.

