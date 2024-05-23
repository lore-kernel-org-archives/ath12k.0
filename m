Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66731C25B75
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 16:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J8smGm9wyfYaLcu/z+cHLlztQnSkYcS3D+AAlmhtlcU=; b=J3HY4uFCbtVyD2241RZSXexXcA
	qCBCAMwokw4+jNpTHdRMp3YY9hnkxC4/+UMNkbAE+eK4RDoFj3X/MVtJPKr6YStAmmZzTXHbJigDx
	DHXekgSeBFx7JHW2RafOnH+JVRZDDUFdXNV50yhMuLKLxsjs4+h5BwNhI37Z2ZK6IELny95pYv1DH
	YEgai6yWgM3I0itbjATJhJjlXn3pRQ3R5sXum0bg+DJP4J8ujEgLm8bW2hw5f9ofC1xec3RfieLOZ
	FtdvUHFgkOUkcVGlqwudFtBf2CfNzfPuIQw9c9Ijecvpzje4J38BPu20Qvpla+YfueuFKFg1a0Iq5
	xNuiYtTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABUE-00000006ntj-0Uma
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 16:40:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sABUB-00000006nsx-0Nix
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 16:40:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44NDqtEB012766;
	Thu, 23 May 2024 16:40:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J8smGm9wyfYaLcu/z+cHLlztQnSkYcS3D+AAlmhtlcU=; b=QgzOXL8GETK1i10N
	FsIKEMpDp21Jw6AKGJLpOyHLDAXOCCce3105SzPQr9RRo0Xsndm4iP0k/cSJMr+i
	Oofouw0QJJd8cgK1nMSbIikPpmoUZY61L5FB272U7N6k1W9u7WMx9Au4TLsU+Vi1
	xzvsYD+0qzqc1Nmx8/fdWsX10ESOpHu7Gdhydv9vbHZl2h+jqcfomTksNHPPIRdc
	ak+ukLi/iRWaIgeLQfL10Qc9elezEIXY/hINDp02GzbJvuw7ZDkmCjpyJuXvyeTU
	+Bp7lI7OXIsT5NZqw77XhXTYSp6Ke06FGjOnJ40jK6BykP0M9JjoiCOMW7bkkCxS
	adqfaQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y9y201s8x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 16:40:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44NGe8I5026126
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 16:40:08 GMT
Received: from [10.110.17.44] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 23 May
 2024 09:40:08 -0700
Message-ID: <282f9a06-f641-427e-85fe-50d7c37f9f09@quicinc.com>
Date: Thu, 23 May 2024 09:40:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/7] wifi: ath12k: support ARP and NS offload
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240523033143.21677-1-quic_bqiang@quicinc.com>
 <20240523033143.21677-6-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240523033143.21677-6-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: JEorWwziUhQsfBwgdNo2aTIiy3beWFWY
X-Proofpoint-GUID: JEorWwziUhQsfBwgdNo2aTIiy3beWFWY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_09,2024-05-23_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 adultscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=612 suspectscore=0
 spamscore=0 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2405010000
 definitions=main-2405230115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_094011_565886_46FD96D1 
X-CRM114-Status: UNSURE (   6.71  )
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

On 5/22/2024 8:31 PM, Baochen Qiang wrote:
> Support ARP and NS offload in WoW state.
> 
> Tested this way: put machine A with QCA6390 to WoW state,
> ping/ping6 machine A from another machine B, check sniffer to see
> any ARP response and Neighbor Advertisement from machine A.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


