Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 545EEC2BBCA
	for <ath12k@archiver.kernel.org>; Tue, 25 Jun 2024 18:44:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYs740eL8j3mTFEJt2fIZQbj18VBkP9WROckCjtMXuA=; b=v+nhddXbO3j+U6VSj8eAJ2GRQH
	bOF3t28MrnQeTYQerqBpga066Dhfg/FAcMgIWFVYsrL2im0JH7FcpIo5NvGAsOHEvTPdmBqh8ip9m
	YlDBocaEIYz/FGL7/WVq7ZGEM+WT4ZLO609OexWXWTFXMqs/FEoW74BNcBH2WMDQQ/hzLI/g0iZn5
	kq/XnOr0M/MgsTMvezBo0P/MUzlJKpU4EXkSYNgikDpfyJylDqZHOzq3Z5PPHHtAniQm+OD0Mncx8
	HNWPaCUtPXxvOjzFs0ad/MGJgVwIQL/4g1q+bTk/+lZlT/k4NdZIm6IRGilmf6sO95h3TWRKt5YI2
	sJt5aT4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB9C-000000048tv-08O6
	for ath12k@archiver.kernel.org;
	Tue, 25 Jun 2024 18:44:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMB99-000000048sk-1Pin
	for ath12k@lists.infradead.org;
	Tue, 25 Jun 2024 18:44:05 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45P9qhUx024310;
	Tue, 25 Jun 2024 18:44:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYs740eL8j3mTFEJt2fIZQbj18VBkP9WROckCjtMXuA=; b=FE3N9JbWUZYAg7HM
	eXrtAA0u6vTJsgWckuRZqW9uNahr+mVMBvQmg1AJEuKFSC4LLyMI9KfidckSFG2J
	Jx3J6MakgbIBqIV4z2/Ki/yCkvRSo6qWV7naBbvTxlwpiSmCYY+0DpxNkEBTT7oY
	Nnr7E/X2AwYNbrpeeW2JFpM1cHxc6DTtpLlzju9RKNdFMXHbKqKAZG7HJd7x/p/E
	vcyVlC1KMCiXGdaw2T8AknaNUo90Ye7YLIPsByLD6dROhk0QF5EiTxvLdPpBnOY6
	GKyfYmepOjKF6+dv1chQ6JE7+TR25x0RcuBOkvS6eHoeHb4v3RSdozwaGDc/wNwj
	bdkPoA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ywp6yqe6s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:44:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45PIi0bJ004263
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 25 Jun 2024 18:44:00 GMT
Received: from [10.48.244.230] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 25 Jun
 2024 11:44:00 -0700
Message-ID: <5aa9fbe7-3868-4130-b7a9-f871467312e4@quicinc.com>
Date: Tue, 25 Jun 2024 11:44:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/4] wifi: ath12k: add factory test mode support
Content-Language: en-US
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240624095305.37189-1-quic_aarasahu@quicinc.com>
 <20240624095305.37189-4-quic_aarasahu@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240624095305.37189-4-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 3PKwuBVGy7jjLnUVLC8ERhqe3qrUwY6u
X-Proofpoint-ORIG-GUID: 3PKwuBVGy7jjLnUVLC8ERhqe3qrUwY6u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-25_13,2024-06-25_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 bulkscore=0
 phishscore=0 adultscore=0 mlxscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2406250137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_114403_819901_5CCA736E 
X-CRM114-Status: GOOD (  14.34  )
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
> Add support to process factory test mode commands(FTM) for calibration.
> By default firmware start with MISSION mode and to process the FTM commands
> firmware needs to be restarted in FTM mode using module parameter ftm_mode.
> The pre-request is all the radios should be down before starting the test.
> 
> All ath12k test mode interface related commands specified in enum
> ath_tm_cmd.
> 
> When start command ATH_TM_CMD_TESTMODE_START is received, ar state
> is set to test Mode and FTM daemon sends test mode command to wifi
> driver via cfg80211. Wifi driver sends these command to firmware as
> wmi events. If it is segmented commands it will be broken down into
> multiple segments and encoded with TLV header else it is sent to
> firmware as it is.
> 
> Firmware response via UTF events, wifi driver creates skb and send
> to cfg80211, cfg80211 sends firmware response to FTM daemon via
> netlink message.
> 
> Command to boot in ftm mode
> insmod ath12k ftm_mode=1
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00210-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


