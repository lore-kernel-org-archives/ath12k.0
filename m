Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E881C61D88
	for <ath12k@archiver.kernel.org>; Tue, 21 Nov 2023 00:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QUwTdUbLxlVUK8LCd/QFm9t5JYm5sB6CugRexzTGlNQ=; b=QbEduKmp2fZmHl
	YRSDQT2kSc6cMlfqg/aV+lp5UNQSlC4Ptv6QBDxrXF7rfTLUZnhQ0DiTOXHJ1uT/YAdrM6myXAg2j
	BKucHiXhmnOzHDsJ0rMp8LNFxv/ICeTUpP/ZGhE1MghXBD8ErSqL8U71+/yiFfiKYEIar9fKhyO6O
	sjLgs/Xbd6ZPYsiHajNSAsZgoyTdiYBMTFEaLDx/+9y7GRssyoo46UzCFyja39j+MqrFb+xjKOswv
	0xwxLSnQ46g2OGmflO9Jde41B/NScHRoYeH450uvmK1Nl1uyPeZbD12ETmH4JU1SqaJ5wJMZw3OYU
	iLKcWYFle+pyIyRLbt8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EnT-00FFdz-00
	for ath12k@archiver.kernel.org;
	Tue, 21 Nov 2023 00:39:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5EnP-00FFd5-2R
	for ath12k@lists.infradead.org;
	Tue, 21 Nov 2023 00:39:21 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3AL0dIas025161;
	Tue, 21 Nov 2023 00:39:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=UYQHJO+9MzRizXqGXRZYBR3tTonbEuTa3FsvgHofFgU=;
 b=IyckkaAukG8EjG85w4La1KiVJ2Qr9gueatb9XvuC9x2IxiraALMFZgCsvDzWT3P8Sp1Q
 B+MHlouSTtGzW4P1nVDm4QCu18/AnMlYquQtFp7Rc4/1eWbljJredTYjnJT4pWN0wh/5
 384IWuqHJyRz36IzUpguYpckmO/yPJwpe3l0J0iI5HForObozEdmlaqsIqmBu2yhUCmb
 tccHSONXTtqN59xvT4essprQg7NFQIEMcXUvWzHoneNaYY5wj243NocFtz7iEyJ+YIT0
 kdyWgHP9TWewJFLeM69MF0Pi623YupgHu0zSDQLqVI81qGsAhIA9QbvUZPm/2/v5diSu GA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ug26ttcym-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:39:18 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3AL0dHrr002921
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Nov 2023 00:39:17 GMT
Received: from [10.110.116.223] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 20 Nov
 2023 16:39:16 -0800
Message-ID: <66edb53d-edd8-4bdc-8573-2f7cf2f31c53@quicinc.com>
Date: Mon, 20 Nov 2023 16:39:16 -0800
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
X-Proofpoint-ORIG-GUID: v2pfS5GII4uWAllpcYGBZuNQRFREYn9k
X-Proofpoint-GUID: v2pfS5GII4uWAllpcYGBZuNQRFREYn9k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-20_22,2023-11-20_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 malwarescore=0 mlxlogscore=999 priorityscore=1501 impostorscore=0
 suspectscore=0 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311210001
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231120_163919_935969_204A05AE 
X-CRM114-Status: GOOD (  24.97  )
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
> ---
>  drivers/net/wireless/ath/ath12k/mhi.c | 16 +++++++--
>  drivers/net/wireless/ath/ath12k/pci.c | 51 ++++++++++++++++++++-------
>  2 files changed, 52 insertions(+), 15 deletions(-)

...

> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c
> index 3bb2d622dc52..4484bac18f4e 100644
> --- a/drivers/net/wireless/ath/ath12k/pci.c
> +++ b/drivers/net/wireless/ath/ath12k/pci.c

...

> @@ -713,18 +731,26 @@ static int ath12k_pci_msi_alloc(struct ath12k_pci *ab_pci)
>  					    msi_config->total_vectors,
>  					    msi_config->total_vectors,
>  					    PCI_IRQ_MSI);
> -	if (num_vectors != msi_config->total_vectors) {
> -		ath12k_err(ab, "failed to get %d MSI vectors, only %d available",
> -			   msi_config->total_vectors, num_vectors);
>  
> -		if (num_vectors >= 0)
> -			return -EINVAL;
> -		else
> -			return num_vectors;
> -	} else {
> +	if (num_vectors == msi_config->total_vectors) {
>  		set_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
>  		ab_pci->irq_flags = IRQF_SHARED;
> +	} else {
> +		num_vectors = pci_alloc_irq_vectors(ab_pci->pdev,
> +						    1,
> +						    1,
> +						    PCI_IRQ_MSI);
> +		if (num_vectors < 0) {
> +			ret = -EINVAL;
> +			goto reset_msi_config;
> +		}
> +		clear_bit(ATH12K_PCI_FLAG_MULTI_MSI_VECTORS, &ab_pci->flags);
> +		ab_pci->msi_config = &msi_config_one_msi;
> +		ab_pci->irq_flags = IRQF_SHARED | IRQF_NOBALANCING;
> +		ath12k_dbg(ab, ATH12K_DBG_PCI, "request MSI one vector\n");
> +

ath12k-check is flagging this:
drivers/net/wireless/ath/ath12k/pci.c:761: Blank lines aren't necessary
before a close brace '}'
<
>  	}
> +	ath12k_info(ab, "MSI vectors: %d\n", num_vectors);
>  
>  	ath12k_pci_msi_disable(ab_pci);
>  


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
