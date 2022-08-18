Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A11EC25B0E
	for <ath12k@archiver.kernel.org>; Thu, 18 Aug 2022 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ao/0uvFuk0RjC1DX95DXu9Ab3L17QnXwQzZW4L+H8Nw=; b=Vi8v0uce6fiuYW
	6oFb9o1d6QT/YetdfCVUofWXtf/gnfjB97AZmEdBiTegOo2PPeU878H+4Xb5CpDnYyeeAYyj6NrUb
	D1niOkRgM2FziOb5mJNwPyAwZM048s9qW0piOOviFp6XoMkwcBxIGoVgDIHTDtYTVr5MuaVD+msSD
	C9CfIE8IIExdaYQkgdtXPWC/ojj2iGM1DipLjWHrLWlK3WycujwuinVfp+fIjYg8t8vteLqBDrEG6
	arUXd/MwKuy0bBK6ssWq1XsWQZBxYIwnDaPHl4TZfNfk8OgP/2NZh79F4xZ0pK4bJYHgPmEz6mqpb
	Ct/JPwK5/n33Esc1tThg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWx-00AwQj-Pl
	for ath12k@archiver.kernel.org; Thu, 18 Aug 2022 23:02:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOoWu-00AwLI-K3
	for ath12k@lists.infradead.org; Thu, 18 Aug 2022 23:02:26 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 27ILxdfF027517;
	Thu, 18 Aug 2022 23:02:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=xB2x825eYZu+c0CZhOf14LGGuNhUb+GEZHWjxU8VRAY=;
 b=kpTm4dBJHyWnKbU2CJ997Hz6LmXBL3nvsB3S62GUZhNI6WhDQBysSmf3pSbKykLgmbBA
 71aItDQlgses1nz576W5JcxLYYVXWHsVnsIavsTGfzmm/AwfqZ51ed2mZx8WFoze+TU6
 Efga8/DmQUI5nL/xEf5MYQiO2fb2ffCwPHz4Oes0wdUDjkW2MDf73yqAslCKOKIl17a0
 f+eX0l2cClCjOF/u7QdPMLai7X4lI5b3GHuopfA5S5+mF726DO/ZwrvonW05QAk9qZ9w
 kBWVHKmUY787kVZ97dyGDD0z5M24R5EfSAnVp6W0cyvw9ZxJoTxT1NDYU1ARklO8IjyY 9Q== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3j13c05ust-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 23:02:19 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 27IN2JEC002102
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Aug 2022 23:02:19 GMT
Received: from [10.110.11.6] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 18 Aug
 2022 16:02:18 -0700
Message-ID: <7b06d248-c976-6c9f-4d5c-5dec7b1d5511@quicinc.com>
Date: Thu, 18 Aug 2022 16:02:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH 35/50] wifi: ath12k: add pci.c
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>, <linux-wireless@vger.kernel.org>
CC: <ath12k@lists.infradead.org>
References: <20220812161003.27279-1-kvalo@kernel.org>
 <20220812161003.27279-36-kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20220812161003.27279-36-kvalo@kernel.org>
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: G-oFaRIwDyhWmJLXyBODr9WRDDlSGvyO
X-Proofpoint-GUID: G-oFaRIwDyhWmJLXyBODr9WRDDlSGvyO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.895,Hydra:6.0.517,FMLib:17.11.122.1
 definitions=2022-08-18_16,2022-08-18_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 adultscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2207270000 definitions=main-2208180084
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_160224_713360_DABA14A6 
X-CRM114-Status: GOOD (  19.76  )
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

On 8/12/2022 9:09 AM, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> (Patches split into one patch per file for easier review, but the final
> commit will be one big patch. See the cover letter for more info.)
> 
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> ---
>   drivers/net/wireless/ath/ath12k/pci.c | 1344 +++++++++++++++++++++++++++++++++
>   1 file changed, 1344 insertions(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/pci.c b/drivers/net/wireless/ath/ath12k/pci.c

snip

> +static void ath12k_pci_remove(struct pci_dev *pdev)
> +{
> +	struct ath12k_base *ab = pci_get_drvdata(pdev);
> +	struct ath12k_pci *ab_pci = ath12k_pci_priv(ab);
> +
> +	if (test_bit(ATH12K_FLAG_QMI_FAIL, &ab->dev_flags)) {
> +		ath12k_pci_power_down(ab);
> +		ath12k_qmi_deinit_service(ab);
> +		goto qmi_fail;
> +	}
> +
> +	set_bit(ATH12K_FLAG_UNREGISTERING, &ab->dev_flags);
> +
> +	cancel_work_sync(&ab->reset_work);
> +	ath12k_core_deinit(ab);
> +
> +qmi_fail:
> +	ath12k_mhi_unregister(ab_pci);
> +
> +	ath12k_pci_free_irq(ab);
> +	ath12k_pci_msi_free(ab_pci);
> +	ath12k_pci_free_region(ab_pci);
> +
> +	ath12k_hal_srng_deinit(ab);
> +	ath12k_ce_free_pipes(ab);
> +	destroy_workqueue(ab->workqueue_aux);

it seems strange/asymetrical to destroy this here.

it was allocated in ath12k_core_alloc() so I'd expect it to be destroyed 
in ath12k_core_free() to maintain symmetry

in addition I don't see ab->workqueue being destroyed, and imo that 
should also take place in ath12k_core_free() for the same reason

> +	ath12k_core_free(ab);
> +}

snip

> +static SIMPLE_DEV_PM_OPS(ath12k_pci_pm_ops,
> +			 ath12k_pci_pm_suspend,
> +			 ath12k_pci_pm_resume);
> +
> +static struct pci_driver ath12k_pci_driver = {
> +	.name = "ath12k_pci",
> +	.id_table = ath12k_pci_id_table,
> +	.probe = ath12k_pci_probe,
> +	.remove = ath12k_pci_remove,
> +	.shutdown = ath12k_pci_shutdown,
> +#ifdef CONFIG_PM
> +	.driver.pm = &ath12k_pci_pm_ops,
> +#endif

conditional compilation is unnecessary here since SIMPLE_DEV_PM_OPS 
handles the conditional

> +};
> +
> +static int ath12k_pci_init(void)
> +{
> +	int ret;
> +
> +	ret = pci_register_driver(&ath12k_pci_driver);
> +	if (ret) {
> +		pr_err("failed to register ath12k pci driver: %d\n",
> +		       ret);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +module_init(ath12k_pci_init);
> +
> +static void ath12k_pci_exit(void)
> +{
> +	pci_unregister_driver(&ath12k_pci_driver);
> +}
> +
> +module_exit(ath12k_pci_exit);
> +
> +MODULE_DESCRIPTION("Driver support for Qualcomm Technologies 802.11be WLAN PCIe devices");
> +MODULE_LICENSE("Dual BSD/GPL");
> 


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
