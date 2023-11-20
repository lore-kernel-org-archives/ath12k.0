Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE3DC2BB3F
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uWHZqyUT5hcI96Z7I98Mmqh5TmAcph6tyH/Z/1+sSiM=; b=y2yusQoJIc69Xh
	JrnWtaOsW1vldLoNaQAzUHTbORmUxPgTsqFAv4i70paUmFMl8sQ1KuKFy/q/QR2IL6/5C9go09gEx
	aE4dOjmd91m+S6zo0mvZLrk8oXXvk7hyXlQJe+pk/NiWAHpds3b7gds+k9Gs0UPs4ZdWdsYk8a5ub
	8aAN1G2UMuCZiGYTE4Vk4JSuA+620w35OoRLQxPoKvniM5oPWzIlS6MyG4ofvJGrh6tMPF5K2AePe
	Wd1eiH09KFIjK5aRYCdKahWLkpIo0zbA4znDBxW+c0/yGC/ZXW9WQMC7toHf9G+a8VSyrgbNBrGc+
	7wJO2W3I3BgkFF8dNDBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56Yd-00CsOX-2I
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:51:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56Yb-00CsMM-16
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:51:30 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AK7W0WP006476;
	Mon, 20 Nov 2023 15:51:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=VkW9ffSyE8U+Ch9mDEAohFgfkWv+p88MJOvk32rYvfs=;
 b=l1BjPA1mMBbri9pyNKGsPAI6zowNKKPyirAkgnlnCk+ty+AY5iCUoQxCdOrzq6/mhTBx
 MpTb1hOFnCyeCTOyycgVJjnJuj4kwiGtSIvkSHryN/EqXfnNDeJvKgLMjvmyLs2jU6Vn
 cwETYsO4Ke15lFCGp+zsy6YyRCWvyLHqD8q8koz+o+7CxgbArzMOnafETSc/QxIdTSqz
 +cPXcaFdD8lnICa+BuDXdV+gIfYRxYQuEnGZWO8stwBfzvlRcEC/kCh2bF4AYo6eiyvq
 5QE5R4nrduRZpHB3cO4wRNaIvDIB5JalTlB6LcDxSuqsnyKxsNYfkyBLAcGB8eLbYPyp 9w== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug34u1454-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:51:27 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFpQnf006426
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:51:26 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:51:26 -0800
Message-ID: <663c718f-2f72-445d-b3c8-49ba1a307f8b@quicinc.com>
Date: Mon, 20 Nov 2023 07:51:25 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix the issue that the multicast/broadcast
 indicator is not read correctly for WCN7850
Content-Language: en-US
To: Lingbo Kong <quic_lingbok@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <lingbok@qti.qualcomm.com>
References: <20231118134538.19545-1-quic_lingbok@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231118134538.19545-1-quic_lingbok@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: v1ptQHQ7uS65wuT_TJUoE4vlMt-1QLq0
X-Proofpoint-GUID: v1ptQHQ7uS65wuT_TJUoE4vlMt-1QLq0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_15,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 suspectscore=0 phishscore=0 spamscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=522 malwarescore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075129_518783_54F70B72 
X-CRM114-Status: GOOD (  10.81  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/18/2023 5:45 AM, Lingbo Kong wrote:
> We observe some packets are discarded in ieee80211_rx_handlers_result
> function for WCN7850. This is because the way to get multicast/broadcast
> indicator with RX_MSDU_END_INFO5_DA_IS_MCBC & info5 is incorrect. It should
> use RX_MSDU_END_INFO13_MCAST_BCAST & info13 to get multicast/broadcast
> indicator.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
