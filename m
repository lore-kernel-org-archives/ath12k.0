Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE656C07C79
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 17:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMatxaznbfHN2DlNPykUz3hj551MmZqe8h6PfKf1pdA=; b=wySQw/tiitkE/0RnzDzvMiqgll
	okFFLOUDT/NOZVszOnPpBbam4RV9vTubv4RXtql4RD4lDAW7Cp3kdiZdItQoSyRFDBSdPSnHcmeY2
	7cCfC5SZxA+jVQf0sy8AkhrxZiy9/RN3nbQYqIwCCcqqJrr1BTW5El5YO7b4MdQL/TN6yaueZOUD4
	m2D7I99U13Cc6vwd4iNErUaWAPxdSA4NI5YVxo+z5Dfp/9kU3OSIpeSj/PPQqTWpVEILAgqVUwHV7
	d00TXNDVBs/MsK17Xw1DyLbRgN3T+VzSJj93OJwfbvIqoZHa1bMkPKdATyzp9X+U5oFh9X8rUNz4+
	NMA3s4+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpp-0000000EWOF-1Wjv
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 17:52:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryxpl-0000000EWMX-2ihn
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 17:52:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43MFQB3f020549;
	Mon, 22 Apr 2024 17:52:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=dMatxaznbfHN2DlNPykUz3hj551MmZqe8h6PfKf1pdA=; b=d7
	55hgkBw+EtVhhqBbbwrZq+bJrIZM21b+xxFR3BwHofWn8dXVP6exzJ+taAH2nYrs
	MQO+q8LpxZ3Anxp/udIE30D0AFy2vPkIJw0URPnAMnsFU7CwG1V2jM+10OMvhUMQ
	vP6oHlzqoQ+UPlQ1wVr+8M/+c5I7xbU87Xswbsyx1HAQkyNd65ftlvuiknP4abot
	MlevtrAQkamEqKXHKtHWXOt0/t9KZ8CbCutlWReiREvI4bFmO6JXmHh3RASlJ7FQ
	xg00ZHb+jBzTAQpR0ucYoKexeFJ1Xs8M3ZeIQvLZG4IlQNKfMVvCFmdh58L+se3x
	VxK4MT4Tr9r9/Ffnd9EA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xnne298qy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43MHq32R029226
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 22 Apr 2024 17:52:03 GMT
Received: from [10.227.110.203] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 22 Apr
 2024 10:52:03 -0700
Message-ID: <76020858-ca74-4f56-ae34-6a2d02dcda4e@quicinc.com>
Date: Mon, 22 Apr 2024 10:52:03 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/10] wifi: ath12k: flush all packets before suspend
Content-Language: en-US
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240412060620.27519-1-quic_bqiang@quicinc.com>
 <20240412060620.27519-7-quic_bqiang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240412060620.27519-7-quic_bqiang@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Z-qEprKeH5Ie814DwqBw-8w7cx64VZuh
X-Proofpoint-ORIG-GUID: Z-qEprKeH5Ie814DwqBw-8w7cx64VZuh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-22_09,2024-04-22_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 mlxlogscore=809 mlxscore=0 malwarescore=0 clxscore=1015
 adultscore=0 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404220075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_105205_922032_EB7CAE14 
X-CRM114-Status: UNSURE (   9.15  )
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

On 4/11/2024 11:06 PM, Baochen Qiang wrote:
> In order to send out all packets before going to suspend, current code
> adds a 500ms delay as a workaround. It is a rough estimate and may not
> work.
> 
> Fix this by checking packet counters, if counters become zero, then all
> packets are sent out or dropped.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


