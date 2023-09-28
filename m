Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02EE6E732DE
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 14:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q8ADWFzmR1Tk2lobiTxbKbDMeM+8whAL/zdPzmJJqsg=; b=4m5GJ/g0YcNztU
	6HW6vfPZ23QIAKAlH4M2rzMpR7JPeq4nUlSk2GITZ1tgu9wXy6QDMPGf63Xqr3YvXFGQLv6stWuUB
	Yg1IiMph/veyqxjKwzFQbxJgiUxrY0xfnOi2nbPIKFbUAul0sjIluCmkmJU4rcV3OGnZFjCrminPF
	tFYdw9aSWNm21WgAflL4GrnufR2QAbTDMWZE5mxQfmmuPwo5JV12tARoDOOYLQdE/Av0jiIy1AOaI
	FfUB+6W4OHcVT1627hFQTw5G0bJIPPckTEMO5y3grIM6j1CYdwYAwdg+gJzW7zbdCJBRiWiN4uQQZ
	yzBC2zK4gzJoeJ1cW5pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qls4v-004uXZ-1I
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 14:33:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qls4j-004uO2-2l
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 14:33:12 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38SCASaM026799;
	Thu, 28 Sep 2023 14:33:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=9EugeG7KcT70s4JrEY+QWOT1ARxIpcCxDK6YsjoRzpM=;
 b=AG0jT6/JYjEMuxE5FetMiLQJEwJ2ZshdW3AwVmJoEoVaCb7hDtGl7fK9sUyCSWsH85Pt
 EsYCWqNbVYhxVqpbEcuuGtNGXePPFS3awc8tSdvor+IMv2B3cDkOr48NKdXyqBDlULd0
 gEmuXQsI921KaOEICDzyqsj4TE30DD+QTzxM+qTkLHx2qiwPdCnXI4QdpGry7gk4+vwO
 1dAWUVTcKIIIUr6WLvU8TsRukVbXbuPPp+dRU14TsXF59CbilPDdVmpJf9zJoN0ENDJ4
 U8rXa79CUPJ+LHOFdqc2E7swPB8RuojoM9U/GU4O7+OQ8yu2sp2H+k1gwZwHs1U++CBQ Ug== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tcpkgttm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 14:33:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 38SEX4VI018058
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Sep 2023 14:33:04 GMT
Received: from [10.111.177.152] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.36; Thu, 28 Sep
 2023 07:33:04 -0700
Message-ID: <887e4058-ef0e-4664-9bb5-3b73dc546f75@quicinc.com>
Date: Thu, 28 Sep 2023 07:33:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] wifi: mac80211: mlme: enable tracking bandwidth
 changes for 6 GHz band
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20230928055022.9670-1-quic_kangyang@quicinc.com>
 <20230928055022.9670-4-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20230928055022.9670-4-quic_kangyang@quicinc.com>
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: THHmxybU0oJqpV6Wwjdp2vi94rUQxv5H
X-Proofpoint-ORIG-GUID: THHmxybU0oJqpV6Wwjdp2vi94rUQxv5H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-09-28_13,2023-09-28_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 mlxlogscore=782 suspectscore=0 lowpriorityscore=0 adultscore=0
 clxscore=1015 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2309280125
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_073309_922930_E2CE7A37 
X-CRM114-Status: UNSURE (   8.86  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 9/27/2023 10:50 PM, Kang Yang wrote:
> After connection, mac80211 will track bandwidth changes upon
> beacon's CRC is changed. But it will stop tracking bandwidth
> changes when these is no HT Operation element.

nit: s/these/there/


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
