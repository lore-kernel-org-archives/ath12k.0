Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A709CC197A0
	for <ath12k@archiver.kernel.org>; Mon, 20 Nov 2023 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9fvMxruq43XB7e4Cv9ekugP4jJQU4OjXAPzmdaimKIc=; b=hgD26+rh2VP2LN
	RwvY7dbVe5CqdhIPXNp0xYWh9Ca48t0mh4v1w137ZO1m+uGPKDrzTAbcmVr3+eHfAW3x+pgQR4LzZ
	d72RijSB5/kPFTzGVd4eM/rDTG9PBsbFUSOyp755f+LnCMT4tcoIbOISFJUd/m0OIpsqs0r/cEPwp
	faxL1ZsCs55/Y7LkYC3RPwcPtay1NffzMjQgANB+Bspq9v98SMeE0O/lNPiCy3LBFA6/s86Csl/u1
	SAruFL7RXKS3pgUyWAbYHA4G4vD0GrnIwL38l+yJ8G2PNrfaIfzyktgnGsK6eBf6/w61gCQIL4HIl
	OqEwmdFCCdypNlEtKRPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r56ao-00CtyS-1C
	for ath12k@archiver.kernel.org;
	Mon, 20 Nov 2023 15:53:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r56al-00CtwF-0x
	for ath12k@lists.infradead.org;
	Mon, 20 Nov 2023 15:53:44 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AKF0BTD014543;
	Mon, 20 Nov 2023 15:53:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=vPaIEzoSDIXJihqnLjByKDYzijjq52zlqEDyWMgHd1A=;
 b=CCNw15CSD+8RESOQ2+HRyotxMXj8kXrAoWjbMGF8+zbaBVPDTx6CWAS2L85ua3Ell5KE
 iMpCXXtjQDvg+3ujjqOE62SGVt2vJ76QAJwu1O0672yUdOs9+pL/+M1D05T9gvVsk4du
 7Ojw1FhDp+DcnD3oM6uJbCOSMu0XzRto0AQpsBQeQNG6vBXuOOzBcS67/5ffA43OYhaY
 ZpPLV8JnqR+skWHHekQVGTABPn902npoNKjW/eyT85GxrHxxiAskoXiaT4+smW1Qp6Ss
 Ou4QUq55YxTbE5uB6oGxE8Ul4pPPiHoGpYSSPNeQN9rqc8rR+LZ5uMnGjMvo9wX8Gt/Z FA== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug5370u2m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:53:42 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AKFrgE8014827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Nov 2023 15:53:42 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 07:53:41 -0800
Message-ID: <aa9325a1-0651-4e59-9c63-49c834b0a5c3@quicinc.com>
Date: Mon, 20 Nov 2023 07:53:41 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/7] wifi: ath12k: add support one MSI vector
Content-Language: en-US
To: Kang Yang <quic_kangyang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20231120101543.4369-1-quic_kangyang@quicinc.com>
 <20231120101543.4369-6-quic_kangyang@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20231120101543.4369-6-quic_kangyang@quicinc.com>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 9ZdcWNSMrwa1n43129GTkWugVteK_BZN
X-Proofpoint-GUID: 9ZdcWNSMrwa1n43129GTkWugVteK_BZN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_15,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 suspectscore=0 adultscore=0
 mlxlogscore=790 spamscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311200111
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_075343_339808_969D68ED 
X-CRM114-Status: GOOD (  15.46  )
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
> On some platforms it's not possible to allocate 32 MSI vectors for
> various reasons, maybe kernel configuration, VT-d disabled, buggy BIOS
> etc. So ath12k was not able to use WCN7850 PCI devices on those
> platforms. Add support for one MSI vector to solve that.
> 
> In case of one MSI vector, interrupt migration needs to be disabled.
> This is because when interrupt migration happens, the msi_data may
> change. However, msi_data is already programmed to rings during initial
> phase and ath12k has no way to know that msi_data is changed during run
> time and reprogram again.
> 
> In case of one MSI vector, MHI subsystem should not use IRQF_NO_SUSPEND
> as WCN7850 doesn't set this flag too. Ath12k doesn't need to leave IRQ
> enabled in suspend state.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
