Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C03B0C47422
	for <ath12k@archiver.kernel.org>; Sat, 27 Jan 2024 00:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5eBECWCDxYEA54enC1/hrGb/7yL0uYCC1cetVUWAyeo=; b=gPfYx6a/zNI6O3qbQ+EGboyWH6
	ckS3Z90zBrK+WOf5F7C0F3nZvmV0mdjcZorYBKU/U5D8gna9O07snuFT3ppZADweD66aMO7D2Tzc7
	QkmzUtBlE0jjZGQ66DkEcJcR7gJ7Osl0Jd7IQHfUZEidcVqMujsmc/puLkdcDJFeRnH4VERph0xPd
	Q9mAfba924NTkn6Ppenq6wLCmn7TrX1TdAYe7VCAsLIpoTYlUuJPoYydGHX+DPc6dHIG45dXw9csG
	O8//4f1JwcZKzu1vNVzb+OrSZuUY+SDRigfaRawV+oeyp+jsYpiUGxjh6YgaiBgCsvYafjPrjB6IE
	lRMgg2IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWNe-00000005wa5-25hD
	for ath12k@archiver.kernel.org;
	Sat, 27 Jan 2024 00:17:06 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTWNb-00000005wZU-2HM4
	for ath12k@lists.infradead.org;
	Sat, 27 Jan 2024 00:17:04 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40QMx7UG020906;
	Sat, 27 Jan 2024 00:17:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=5eBECWCDxYEA54enC1/hrGb/7yL0uYCC1cetVUWAyeo=; b=Yt
	vSIEh9rwTrO+htCSciBbxUq07wnAXOKTLfxDDuJsA1VPZkUUc+xlvUxE4p7VIfpt
	keFbYFJOABabtrNPH/6HNKAwwKNEM9E2VvKFGjl2viIkkRBL+A9OaIgZM0dX217I
	8vKaWHxSIQS31bJAJQ5fSr57JPpw5UpDfIFLJFhWJTPKcpRVzrPkox/XRdMG0gCc
	inlmV5JOSXDHKi1Dy7DlGnSILeyDy+VImNJsPExQ8s7O7Sxmtp+YG1aJCJyzpjeC
	8NrjP3AOB9xNDlJpt9W+5ai0l7xmJ4xyUkf2iRmIVwZvEceTsMvS8rawf365oxks
	RHyQ5YgPCwW2llM22Sew==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vvjbg8haj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:17:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40R0H2BJ001607
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Jan 2024 00:17:02 GMT
Received: from [10.110.0.209] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 26 Jan
 2024 16:17:02 -0800
Message-ID: <ed00c5b2-1553-4d3b-8a80-07ba82b8f1e7@quicinc.com>
Date: Fri, 26 Jan 2024 16:17:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/11] wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN
 from 256 to 512
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240126115231.356658-1-quic_kangyang@quicinc.com>
 <20240126115231.356658-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240126115231.356658-6-quic_kangyang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q8XqwxlbO9Vp4Wf3hycqbjzpAPcKKvMA
X-Proofpoint-ORIG-GUID: q8XqwxlbO9Vp4Wf3hycqbjzpAPcKKvMA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-25_14,2024-01-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 priorityscore=1501 mlxlogscore=850 phishscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401270000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240126_161703_615864_0E1AA96D 
X-CRM114-Status: UNSURE (   6.54  )
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

On 1/26/2024 3:52 AM, Kang Yang wrote:
> Mac80211 needs more space for P2P scan ie in P2P mode, 256 is not
> enough, resize it to 512.
> 
> Also delete the duplicate macro definitions in wmi.h.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


