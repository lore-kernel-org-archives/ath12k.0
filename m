Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560F9C4167B
	for <ath12k@archiver.kernel.org>; Fri,  8 Dec 2023 00:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSuQSRoEDnz5UnKJbkJu7npS7t0VbbeajitD/xWZzYU=; b=YPXUG668b1UVWeoG5RG6zW8Ijr
	sDlD7C+ZT3LKIdHY3EvhcRUe2RF5ijdLKEKqNF7/0OelYv86Fri0524is16bNpAp0iOEj9Snv1vj3
	4LM2txg5HxDxgMzlx7HVgPHfYjiOgCx7f4IP1qb8pMcvUE2B7k3hWweUk2IvV+OicC2VUQCFcDjrz
	hRm1tLpKF0MPN6R5bXoFpFulTE6M3CftMG/XH16tN8K+8f2Muku1hOmr/IjiDcmmeF9Necb+gf2NA
	1XlpqIF40f0zZ/chGPlbOAhuhNqTl3OT/LI/Fqi9FWXOA/DjlhjsqH4dGg6w9J+9kPXnva434fyZF
	ibp8cS4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOeK-00EJJK-0G
	for ath12k@archiver.kernel.org;
	Fri, 08 Dec 2023 00:23:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBOeG-00EJIQ-2X
	for ath12k@lists.infradead.org;
	Fri, 08 Dec 2023 00:23:21 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B80NKhs016933;
	Fri, 8 Dec 2023 00:23:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=MSuQSRoEDnz5UnKJbkJu7npS7t0VbbeajitD/xWZzYU=;
 b=QSBxxgYS2VtB98MQiP+QjrVq8+EKIoM6mGWHfEMx8FQ0dFRxjBy+o9PzmQ+OGvfB5yMD
 m8BNNRLbvCNN52rAwKg89i+vb95dxOfxIx4G+n7xemjAlg13O0EVER3Ygjk0L/oD/Kjw
 AG0WPAVBh3zdiPZMqHJvmIP8/IMiQwjK/sU91J2TBf2mxQRVWWIdhxbRanaEu0zn00dt
 3Df34y5xczTn4tjQ6ROXjoVkzaecTEb+kfHxbEBqOCZfeR7rcn9WRHxe1C3Nyqqb04pu
 jVDQ2Zfo1EGqgnQlTmM+4YeVHoG/GuClAHBZxpNRP9vX/OzpvBp/uUIvnmyD7KXrTq37 5w== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3uu8p0ajef-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 08 Dec 2023 00:23:20 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B80NJ6l019700
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 8 Dec 2023 00:23:19 GMT
Received: from [10.110.111.75] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 7 Dec
 2023 16:23:19 -0800
Message-ID: <ac0ba332-8610-4292-bbe3-6f8d0a4d9975@quicinc.com>
Date: Thu, 7 Dec 2023 16:23:19 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] wifi: ath12k: Refactor MAC un/register helper
 function
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
 <20231206034920.1037449-5-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231206034920.1037449-5-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: BwcgcvhMo95ExA0eMBL_R_fOcucwM6Pn
X-Proofpoint-ORIG-GUID: BwcgcvhMo95ExA0eMBL_R_fOcucwM6Pn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-07_18,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 mlxscore=0 suspectscore=0 adultscore=0 bulkscore=0
 mlxlogscore=481 impostorscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311290000 definitions=main-2312080001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_162320_831445_B9E899A4 
X-CRM114-Status: UNSURE (   9.61  )
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

On 12/5/2023 7:49 PM, Karthikeyan Periyasamy wrote:
> Currently, the mac80211 hw registration procedure is tightly coupled with
> the handling of link/radio (ar). Define a new helper function to separate
> the link/radio handling from the mac80211 hw registration procedure for
> improved code readability. Also, it can be easy to scale these
> functionality to support single/multi link operation in the future.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>



