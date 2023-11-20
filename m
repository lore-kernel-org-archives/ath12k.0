Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8914EC2BB3F
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2Gw4dw2J0KF3QHmCllNBjWD/pU/rz5fhv/1p2eUHPk=; b=vNJz6ugGSJnIXQ
	Ja+cNiLRr0zlD4j+d44c4lCPgYj07g2G0ue5ExGkmoKGD9ROKZfdNDZuAxyd70Utle1AJ6Cj2dFbT
	x/KOXNffLNPfkRKKOfFfziQjGvNtF/fqxP4goxHeuI1VuQ5O4qw8ZfpoG+ehhRRXdK/01tLyD3J6D
	iCcv9Mj+VtG5VZJcFKr1f4l+EKASr4U1UzPAfDqguZkrROVII+Dg0C8zprTZ8auT5eYzxD9GIxJdL
	Lwz1HECVu3ELVrnHWooSS4vUZpavepKxtpUj0c+RH7E5KKW5ZzyLbxqtcOqLfym55J5cB+z/XeRTt
	E+t7hBNZqmwSVJRBSsAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56ZF-00CslB-0p
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:52:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56ZC-00Cshi-0U
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:52:07 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKFgbpQ027103;
	Mon, 20 Nov 2023 15:52:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=5smMQP6Bi+Cj+G7n9KxW3cLLytPUPicQYTHAbs4fHPw=;
 b=GLqR4nHcVV0yucWb8IRrj3i42TekYD5wrVqbe9oyL3Lu4zTWlmgN1VcSU3xQ1TSEeQO9
 IIU8Unty/mmT/KW9sb6p88KTYX0Qvv9OHkGmkC43EGJuI5BsFsvc89NxhrTMegIewkBG
 A4Xm8k7UNWyV9PtyZP1AgAb38MW62VdL+//NariwBmIR+PscpBG9r8stDgB0re0jf0cG
 NfU1igShE90vMLoOCLuVr4z5WiBeTvCBSS2+m27DQI9IMfa1fczw9u6XSoBbZDkeQR4b
 F5MQeklNEdbtmwdW1wD7npM0m+/JsmmEIhS2faPbcrLt6x9khpuOCMq+v+X2V8tERNiv MA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug30mh4kf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:03 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFq24x007203
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:02 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:52:01 -0800
Message-ID: <b463bfc3-d18c-4d6c-bde7-f79f7e38fb2f@quicinc.com>
Date: Mon, 20 Nov 2023 07:52:01 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] wifi: ath12k: get msi_data again after request_irq is
 called
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
 <20231120101543.4369-2-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120101543.4369-2-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2nSrn7z1d73xN02CWccRy8CrFpwztw_7
X-Proofpoint-ORIG-GUID: 2nSrn7z1d73xN02CWccRy8CrFpwztw_7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_15,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 clxscore=1015 mlxlogscore=570 priorityscore=1501 lowpriorityscore=0
 spamscore=0 phishscore=0 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075206_195919_BBF5D120 
X-CRM114-Status: GOOD (  16.26  )
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

On 11/20/2023 2:15 AM, Kang Yang wrote:
> The reservation mode of interrupts in kernel assigns a dummy vector
> when the interrupt is allocated and assigns a real vector when the
> request_irq is called. The reservation mode helps to ease vector
> pressure when devices with a large amount of queues/interrupts are
> initialized, but only a minimal subset of those queues/interrupts
> is actually used.
> 
> So on reservation mode, the msi_data may change after request_irq is
> called, then it will lead to spurious interrupt. But when VT-d in
> BIOS is enabled and ath12k can get 32 MSI vectors, ath12k always get
> the same msi_data before and after request_irq.
> 
> So in case of one MSI vector, ath12k need read msi_data again after
> request_irq is called, and then the correct msi_data is programmed
> into WCN7850 hardware components.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
