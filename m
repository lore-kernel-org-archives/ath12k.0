Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005C7C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KW5nS7VTMucCXFt0B0eim3PrlgkTFVgGgvWSmDfVNxs=; b=Pes30JQvY+pxmYp7niHE01nooG
	zs/GrzNQE2KSqxBo/TnOGAgy4knhE774IgUWjlc2XmFjDd7HY3gk5OQz89pBrotD61o0OepWlQusS
	WCiM9UKm18vCOJK6TJufXRcCQeANWUfk+vi868hI9PVXi3q7TApdG1qsUhg8lhLKpUGgK6M74NgHd
	S8mwWZJLq6/kxatW4AMkAOie/d1jyekOy8WojaxQcmg2reOQDQGTcvB4FeCk6Su6HrBE3sWOMfDWy
	j3bjlkBxmCu/Blz5ZAFghVA+tJxqDkmziGHlaOSP0SjKz22pMGstoTBpxqTv/Z7607+3bJXyqKHRZ
	mne8YsnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4gn-00BUKK-26
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 17:05:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL4gk-00BUJk-0F
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 17:05:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 403G8bOP031513;
	Wed, 3 Jan 2024 17:05:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=KW5nS7VTMucCXFt0B0eim3PrlgkTFVgGgvWSmDfVNxs=; b=MG
	uvFHRNUv1+vF7QutzG5LztxCNurYx5Zz8+V+YZhQjzBtEtshNeayeQiyC5Bn1MTn
	jC+drWmchzIhcSqM2ZKaZoivRsxKIajftvyU0AQwdSbatavRA/8tTjJEJRKYY91W
	q77H9hQmNMAqjhVF7Mizog7b5kKYfS8FOK0rx54CNXUAhgu1CVo/Vtlw6ioZHvc8
	xz7s9VBJhJZAHoJLPZ+F0Jnc5z9QbkNxagHJzjyAibY2FgcQf1gruzxJd57Zy8is
	YvQXO6UpBnL+vKZ0xSsA500+wbuyYmAoSu+Rl981P0wO6lIOWawgfypHZXZgLJyQ
	Keris0UgCBAeTrelLx/g==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vdaufr4rm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 17:05:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 403H5nRJ021257
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 17:05:49 GMT
Received: from [10.110.76.17] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 3 Jan
 2024 09:05:49 -0800
Message-ID: <5825fb85-cade-4db9-9021-ec8dd4f63838@quicinc.com>
Date: Wed, 3 Jan 2024 09:05:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: add processing for TWT enable event
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240103050926.14115-1-quic_lingbok@quicinc.com>
 <20240103050926.14115-2-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240103050926.14115-2-quic_lingbok@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ZuiL9whL0kJioLl7jfOFmb370SlVsQ3k
X-Proofpoint-ORIG-GUID: ZuiL9whL0kJioLl7jfOFmb370SlVsQ3k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxscore=0 lowpriorityscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 mlxlogscore=683 bulkscore=0 adultscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_090554_120903_CACC2464 
X-CRM114-Status: UNSURE (   8.41  )
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

On 1/2/2024 9:09 PM, Lingbo Kong wrote:
> When ath12k send TWT enable command to firmware, firmware will return a TWT
> enable event to ath12k. Through the analysis of TWT enable event status, we
> can easily obtain the status of TWT enable command. It can be more
> convenient to debug TWT.
> 
> This patch works with WCN7850 and QCN9274.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


