Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFECC7EE21
	for <ath12k@archiver.kernel.org>; Fri,  5 May 2023 03:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lF1emXrgNTgsZDbqIFwqbVcUGXGtIEUkx7C1c4CYFCQ=; b=zOUi1GGlIahEcy
	CslsHTnP4QCFVk7uAq+/WAYWIQIPBmnDCOYGdRvWxSsSRyeocB9Ywbt9KfrpRB1q6N2GbQBYnBFUc
	+3Q0vbIlawBVBLZ4JHKiqZVBOlcoKaRskJxrPiGLrqxN7/gRjXx4X2wdC8Tx7a6LIiKg9b3vvqLn6
	gcvkJ9PNJhtp8uJlwCjyC0pmxcH44D8sq975BMNzTYcBWltWgSs38ZG0tepd0vtA2NEIGp0SGhEJk
	C3lTBOMHteR7j/dNUWV9+13pdod6LkPtpLgq7+mNSADSQf+Ye8bdMRjq+daeVbv+cKAXeDleAsK8o
	SYwbSRyaDAapUaSHo4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pulpr-009bta-2o
	for ath12k@archiver.kernel.org;
	Fri, 05 May 2023 03:10:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pulpo-009bsG-2w
	for ath12k@lists.infradead.org;
	Fri, 05 May 2023 03:10:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34532nhs030745;
	Fri, 5 May 2023 03:10:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=+EEcic9YW8adPflQvC7dJKIL2bz4FIbMGUzGQptH45M=;
 b=MIsn6qTPMTtqDSh0HoEa8rQZ6kBY0/HAvX7CPXqAk4mlM3cGMaC1Gzxwb9RpGPPIlgx3
 XV/TGF/xbIijkX4nmabeThmDTGX4c4BmO1VVj2cP9YugolwAy9JDvOxVXu46fsx7DzUX
 Fl/2QbrjqGSNwHkIyjDPAoHgGaiz/p0ijSx4Hf+r8Wy11xRc+qsH0Idd9QbQ5wznTIeU
 enngi1xf1LCwUWS6/TIbl8b2kx0fFV7k16wbJPE0hRwKDr+rkv+G9m7L23PrHC2hq9/J
 DZhq/nbhpoSlx/bZm1GoiImbhp5ksvIGO1+FohwS2wGIrGz7+wc3w6SBAd2QLYO36nRr 9A== 
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3qc7a42fnk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 05 May 2023 03:10:13 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3453ACLS012193
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 5 May 2023 03:10:12 GMT
Received: from [10.253.76.254] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.42; Thu, 4 May 2023
 20:10:11 -0700
Message-ID: <d131fe0b-f416-f221-217d-4a42b932a680@quicinc.com>
Date: Fri, 5 May 2023 11:09:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v3 00/11] wifi: ath12k: (v3) EHT support
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, Aloka Dixit <quic_alokad@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
References: <20230413215156.2649-1-quic_alokad@quicinc.com>
 <87ildjtc1c.fsf@kernel.org>
From: Wen Gong <quic_wgong@quicinc.com>
In-Reply-To: <87ildjtc1c.fsf@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 9K_6JayOUGDY5DBxUxzwl88WCePnWWIH
X-Proofpoint-ORIG-GUID: 9K_6JayOUGDY5DBxUxzwl88WCePnWWIH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-04_15,2023-05-04_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 clxscore=1011
 mlxlogscore=846 mlxscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303200000 definitions=main-2305050026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_201016_956227_899EEAFA 
X-CRM114-Status: GOOD (  10.16  )
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

On 4/26/2023 2:03 PM, Kalle Valo wrote:
> Aloka Dixit <quic_alokad@quicinc.com> writes:
>
>
...
> This breaks WCN7850 support:
>
> [  144.039164] ath12k_pci 0000:06:00.0: BAR 0: assigned [mem 0xda200000-0xda3fffff 64bit]
> [  144.039315] ath12k_pci 0000:06:00.0: enabling device (0000 -> 0002)
> [  144.046220] ath12k_pci 0000:06:00.0: Hardware name: wcn7850 hw2.0
> [  144.118539] mhi mhi0: Requested to power ON
> [  144.118716] mhi mhi0: Power on setup success
> [  144.222303] mhi mhi0: Wait for device to enter SBL or Mission mode
> [  144.627712] ath12k_pci 0000:06:00.0: chip_id 0x2 chip_family 0x4 board_id 0x104 soc_id 0x40170200
> [  144.627945] ath12k_pci 0000:06:00.0: fw_version 0x1005bc12 fw_build_timestamp 2022-10-11 12:13 fw_build_id QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> [  144.959196] ath12k_pci 0000:06:00.0: failed to parse tlv -22
> [  144.959317] ath12k_pci 0000:06:00.0: failed to parse ext2 event tlv -22
> [  150.263567] ath12k_pci 0000:06:00.0: failed to receive wmi service ready event: -110
> [  150.276547] ath12k_pci 0000:06:00.0: failed to start core: -110
WCN7850 use "single_pdev_only = true" in ath12k_hw_params, it has some 
difference while handler WMI_SERVICE_READY_EXT2_EVENTID.
I have patch to handler this for WCN7850, and the patch is verified.

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
