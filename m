Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCFADC2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 18:44:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5wto6Ot276M0oKXTURzqde1PZPMYIsTHzdlXH02mi14=; b=bGx+2lFBcByXuMfb+uf1ZRm0k3
	6TMtAstGk2kB3dXgep3oDEcElYCy0fQYIc1WQoUYUcHHFlkrUM0mtZm8fuPS3AEaF2gbkupC53Nic
	kyMn/lqUUnHrYIFQwe5H96oH6akw05WjV8ihJuuJK2wc5I0+ftdrdRCSgJSgnVU38QvEVfFQ64gUJ
	jE6vAOZAw9mW8Zuat9NDexZtys/cetP1jIk94ngTlnTNS9R2Mm+KFPkIh9K7FsU1LR8U5yNJeVjwR
	w+gNRM08/rTnZeHjkTirTMfYxuCdA7UWhXW7nIv9ga8ktM/rAK8na7ncwNocNQ1oI7tPDKSHBbNl4
	kaA4nrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB9P-000000048z6-0lt6
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 18:44:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB9I-000000048w8-2ELV
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 18:44:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45PHHGCV017130;
	Tue, 25 Jun 2024 18:44:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5wto6Ot276M0oKXTURzqde1PZPMYIsTHzdlXH02mi14=; b=WfvZmR8niIAe6nai
	bXUfTPv8CtxCFUHoqVcyCboHR3YddoQxBEl77fIFu0qEnR7gFLfa/t4d0GlCu3/9
	RqhCmWeA/BWklTMIxwz3Qw0KqwwhWELAVzTeDcGgCSYpfNsQk4GNV+Scffigwhbh
	hn4XCXrFA9V7M5lWPdV5TEPkD8y3WfIbtd09MKNMKeEZxy6Nq9T8PrW0vKopLAnZ
	/D9tkxYlrEr608cS+3EIrTyA4OU5AvFH62YpAG7iKxnzehKmPnTff4fvIuHFI3rR
	lSpJmq6hX6b3RxMd5pPmvnPMJoYIGIGFJJKsE6/OE+DltO8WkqWkvJFBlUVSZTtr
	OCIt5Q==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywqw9f56e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:44:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PIi8NT002735
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:44:08 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 11:44:07 -0700
Message-ID: <9ff83230-6ce0-497d-9427-56036471d648@quicinc.com>
Date: Tue, 25 Jun 2024 11:44:07 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] wifi: ath12k: Fill pdev id for fw test cmd
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Rajat Soni <quic_rajson@quicinc.com>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <20240624095305.37189-5-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240624095305.37189-5-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: NOuBdDpv1qCW_VC321xD7x5eih0XU4ZV
X-Proofpoint-GUID: NOuBdDpv1qCW_VC321xD7x5eih0XU4ZV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 mlxscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=845 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2406140001 definitions=main-2406250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_114412_609972_B1D03177 
X-CRM114-Status: UNSURE (   8.60  )
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

On 6/24/2024 2:53 AM, Aaradhana Sahu wrote:
> From: Rajat Soni <quic_rajson@quicinc.com>
> 
> Currently pdev id is not set properly. That can cause a crash
> if pdev id is not equal to the pdev id when firmware test
> command is run during AP bring up or ping.
> 
> Set pdev id in function ath12k_tm_cmd_wmi to resolve this
> issue.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Co-developed-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


