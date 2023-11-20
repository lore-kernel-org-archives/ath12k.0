Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19DA8C2BB3F
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:53:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ha8KlZm+GGIsaCmNR1vTAHRMZ/Q+LRFJqnz9ECGI22A=; b=u238vLY/sxox1j
	kuX9LhYUGQswdm7x7EdU6PVXE8YVR6fQ/lRXgsHg3b3O6Sb1kIOHdoM7Ar2AfG1W+lvByalcgU5i+
	tSifN4dKq+Ow7CPxVAC+j8T6OWF5sQvCQ+Yuqj0NYad2ep1Tf+Io7O4Gfbw/7hX2h42aJMLo4Mr0q
	sXsiO2I59rap2fAradf+wf54Qtof9gr4Z6tVTJNf9HRNvZQoLI+4JxomGccqMpydP3NM05oLCdkgO
	Rwdh2cKEIRfoOVCsDxB5qVtVUzN+vOeXTdAQMdRwSr0/M4I+eQ5RlwXAs+kCf734SDKuWsa5rcKDM
	dTB4DIsKucOAURLgLEgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56a6-00CtPT-2P
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:53:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56a3-00CtMD-1I
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:53:00 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKD37aV032382;
	Mon, 20 Nov 2023 15:52:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=e788j1RoTs7ISAAXr32HIe4DvF5D5qO4bVA9BMAJP0s=;
 b=NIQBL5JVjYfPdhUVkdPhiPH0g4IVu25/DDCgGpnZr2QMVjExl3BqtvgigSHRVHuW2qbp
 yaXkWnr2mhxHqlTEZDo5YtTsuxSUZ7D9gDOmlIiBXdeZW4tCX4qRyBz0GoTY/Pizc6S0
 /AoM/BfYeeGYxp8TK3cFWgPVUjYdRgaNJZr/Jio0V7UX+xL08sy0WrbHn2NNUt51vDDj
 GA7BTe8mnLJKdOeUUIcz+VPlbPf/Mw44dSuWkxMdUXrU6Hc+g9ZdU0id6Jnvv3XKA9cp
 mJfAYz6mX978scmucX7ibDf+QfJwKB4yA6o5xtu1KsFP/IBkdEPR6j+ahLbiRxHTZ89j 5A== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug37mh3p3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:58 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFqwgw008472
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:52:58 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:52:57 -0800
Message-ID: <3c5031d3-1e6a-49ed-80d7-727ff118e340@quicinc.com>
Date: Mon, 20 Nov 2023 07:52:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] wifi: ath12k: use ATH12K_PCI_IRQ_DP_OFFSET for DP IRQ
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
 <20231120101543.4369-4-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120101543.4369-4-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Lfl6kzoMUMC1jrC1JVGvmmI4e6lUH3N4
X-Proofpoint-ORIG-GUID: Lfl6kzoMUMC1jrC1JVGvmmI4e6lUH3N4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_16,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 suspectscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 mlxscore=0
 impostorscore=0 clxscore=1015 mlxlogscore=534 malwarescore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311060000
 definitions=main-2311200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075259_449967_07D230A9 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On 11/20/2023 2:15 AM, Kang Yang wrote:
> Like ATH12K_PCI_IRQ_CE0_OFFSET, define ATH12K_PCI_IRQ_DP_OFFSET for
> DP to save the IRQ instead of base_vector from MSI config.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
