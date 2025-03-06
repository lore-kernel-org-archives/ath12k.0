Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F46C282D1
	for <ath12k@archiver.kernel.org>; Thu,  6 Mar 2025 05:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DNoyYSURkPvdYAyBl1ersfHcq6fQT1ykjNO8WNKhaok=; b=F2twkSePEEkdExHdR6FllhK4AA
	A8RmhOk9MqJ9tKDBmN+JW+Raj06UhGrV8Byvf+mNRA5xo1ndtPnmEq1S6rxYW2WbXEzFKxpNgDh0E
	WoIUg78SY9BVQubMrkTudzAjFgq3XOfrJjdIu1Nb4wHli+WGyUhKQCsTm5R6xn6iRhQyeiMhKtugA
	3vptvduM8s2wKcXQCE1gS3LubkGOcf5/UdY9kOS19TCl1jZ+sTsiFXQr6cg7XUVj/NgBz+utz3aEr
	333t54Iykka2grLp/qEpZI9mloITl2pFjL9EQSzoo6Ux4EHq+2nx7WbrUacdV1M3pKqtKdFczlDP5
	WWv0G1pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4DU-0000000A52f-04sV
	for ath12k@archiver.kernel.org;
	Thu, 06 Mar 2025 05:56:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq4DR-0000000A52H-3MZA
	for ath12k@lists.infradead.org;
	Thu, 06 Mar 2025 05:56:19 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 525KNg4r023663;
	Thu, 6 Mar 2025 05:56:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DNoyYSURkPvdYAyBl1ersfHcq6fQT1ykjNO8WNKhaok=; b=Fk2lm5acT0oS7qvt
	X1W4QqnNJHzVTxom7IxMlsPd9hfUcv40Sv/61XH6iL/b8qZBQbBvgDgXxoKW9Sum
	S/Vs/vaADYtGY5Z9BJWP3FI+FH0nGHnNqDJJI2TF1GC/OaIIRB4DLwjdhOLcZAfo
	dOMOuHFg1CeWcYxpBjVQo5QcQzEgS9cseEOm77/JXJJZMjecUkItpQrknxx5INHa
	WM9WLYbhApBgvlgyQHs7cHc3ugk9/qHhvxk9fmWQxcLNpovCfVvNeK+QtzCn51lK
	ihBDrmiSz+HVWyhDsLk9E15wsDs66LpJvEoEkDZgCildR+kS8z4IzLd1xLx3/5i+
	DQ6NDw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 455p6t7xc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Mar 2025 05:56:15 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5265uEdU008085
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Mar 2025 05:56:14 GMT
Received: from [10.50.16.15] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 5 Mar 2025
 21:56:11 -0800
Message-ID: <4c4a20b3-acb7-492f-9e8e-ee357118ffef@quicinc.com>
Date: Thu, 6 Mar 2025 11:26:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH wireless-next v3 4/4] wifi: ath12k: update EMLSR
 capabilities of ML Station
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>,
        <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Ramasamy
 Kaliappan" <quic_rkaliapp@quicinc.com>
References: <20250303221843.1809753-1-quic_ramess@quicinc.com>
 <20250303221843.1809753-5-quic_ramess@quicinc.com>
 <addc9245-cfa1-4137-bb27-99beda42a147@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <addc9245-cfa1-4137-bb27-99beda42a147@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=I/ufRMgg c=1 sm=1 tr=0 ts=67c938ff cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=C65UpspZ_Kq9X2i2-EIA:9 a=QEXdDO2ut3YA:10
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: P-OQUGjzylazI5MckUaIpyZZ5Zj3TLJp
X-Proofpoint-ORIG-GUID: P-OQUGjzylazI5MckUaIpyZZ5Zj3TLJp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-06_03,2025-03-05_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 spamscore=0 bulkscore=0 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502100000
 definitions=main-2503060041
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_215617_970899_59DB74D3 
X-CRM114-Status: UNSURE (   8.70  )
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



On 3/4/2025 5:03 AM, Jeff Johnson wrote:
> On 3/3/2025 2:18 PM, Rameshkumar Sundaram wrote:
>> From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
> ...
>> +	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
>> +		/* Padding delay */
>> +		eml_delay = ieee80211_emlsr_pad_delay_in_us(eml_cap);
>> +		ml_params->emlsr_padding_delay_us = cpu_to_le32(eml_delay);
>> +		/* Transition delay */
>> +		eml_delay = ieee80211_emlsr_trans_delay_in_us(eml_cap);
>> +		ml_params->emlsr_trans_delay_us = cpu_to_le32(eml_delay);
>> +		/* Transition timeout */
>> +		eml_trans_timeout = ieee80211_eml_trans_timeout_in_us(eml_cap);
>> +		ml_params->emlsr_trans_timeout_us = cpu_to_le32(eml_trans_timeout);
>> +		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi peer (%pM) emlsr padding delay %u, trans delay %u trans timeout %u",
>> +			   arg->peer_mac, ml_params->emlsr_padding_delay_us,
>> +			   ml_params->emlsr_trans_delay_us,
>> +			   ml_params->emlsr_trans_timeout_us);
> 
> it seems wrong to print the values converted to LE if the host is BE.
> suggest instead you cache all 3 host values and print those instead.
> 

Sure Jeff, will add separate variables and use them in print statement.

-- 
Ramesh


