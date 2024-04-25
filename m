Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF99CC4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 21:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N9zebjNukAn603CxHTQw142WIlEvJ7NuTANKadwCDGI=; b=vtQK8PGcAak0vVthub5jBQlcXe
	58vxkXMF1HTYbZevwzXmOnENtV283/7poyd0MlWFp4a715huCMkPRupluCpzTx8Mh3d8owZZiMXUF
	ETNSsFEwTbmAm2rkIAzSp3S3uoW/Odvggj/GF6UY4cgkmVRwQ+tmX9ILQCiq6/g6hfr1BGXeseCxu
	3XXqimqipuIb9oSxZ0L9BMVs3oyd8jGXl+KFevnozYX8GQ3O/Cm+z0yIX8oQx1e+MNscmOt5dd0Mw
	28CXMVo6XaYgQFi0Q/Zqgm+Mc0uevgAfFEJ88mmGHMzvLmXLXK/yEms8R9Z6JYxOwg71IMC2I4Ghg
	udiSfVxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06NE-0000000ACjo-20ph
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 21:11:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s06NC-0000000ACjA-1WQr
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 21:11:19 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PKdkEX013627;
	Thu, 25 Apr 2024 21:11:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=N9zebjNukAn603CxHTQw142WIlEvJ7NuTANKadwCDGI=; b=cg
	3jO6Cx236P7fRUqQz0FlD8umgTVWgRTJ/TEsVOJbBcbDMqAFIzBGi3hqg84ooP2g
	+FyoBopydcHZz0HGmZpea5IDZwzBt6Ph5bIYgeOeNKQpn0AdNaKx+/8mJhAgsKu8
	qaY05uW0nvd+Hsl4RIlr98MqTz/1L/gMQPLBZomyuDCanACVOohJKTgo8kw4DQ9q
	l3ipd9pcIoPF5IJsRmeEnQ8d3wobO7W+gBlq1WskWC8/67+xmwbi/WGZt+csGUM/
	ehWAuMc8cG1nQlnCWVwa+aWI/rqUaZDS9+JeQcC/e6ipUXhpqC1bBwE2YbWjQX0U
	LatG3aSzDSzg2+UpG+Zg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqengkr9e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:11:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PLBFjI031939
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 21:11:15 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 14:11:15 -0700
Message-ID: <60886a38-52ac-4b4b-9119-10c0473f3326@quicinc.com>
Date: Thu, 25 Apr 2024 14:11:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] wifi: ath12k: Refactor the hardware state
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
 <20240425090307.3233434-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240425090307.3233434-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: AEmlITDFAWrE3xhN8lEeF8QctvBxsU37
X-Proofpoint-ORIG-GUID: AEmlITDFAWrE3xhN8lEeF8QctvBxsU37
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 bulkscore=0
 mlxlogscore=605 phishscore=0 malwarescore=0 mlxscore=0 impostorscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250154
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_141118_447274_3B5EA936 
X-CRM114-Status: UNSURE (   7.56  )
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

On 4/25/2024 2:03 AM, Karthikeyan Periyasamy wrote:
> Currently, in multi wiphy models, the mac80211 hardware state is maintained
> within the radio/link structure. However, in single wiphy models, the
> mac80211 hardware state is needed at the hardware abstraction layer
> (ath12k_hw). Therefore, move the hardware state from the radio/link
> structure to the hardware abstraction layer (ath12k_hw). Additionally,
> update the naming convention of the state enums to enhance clarity and
> consistency.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


