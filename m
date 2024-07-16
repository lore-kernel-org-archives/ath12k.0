Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE7F6C3DA49
	for <ath12k@archiver.kernel.org>; Tue, 16 Jul 2024 23:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O3bzu4lEl4FrcLmHSyYl+vMEdSRfBEg69MDObo0mrX0=; b=RwNeUuUyE7pC04yc85VUApUJU7
	NDE411ywQVTKma1KlfcuWmBHHu6YO6CRd9elklVWdQLn0FueB71rFwng8JAxFcWWN+pdBC9dD1ApE
	Wi2X+0mKO232kADMZzTjnHcHoFc2fm9hCu0EXtV8gnV/zcMtNrQqhAh2Lcdo3Ib7B77wBtNV/whEi
	qGSiwN+z7DRFlil3RTkDJhY8Y1s1dKvwbeuRSe3jQiOM5aRD7s4XjO7/O8ZrSMkPsrKnYfJIrUZbC
	bp7pKQKCxFsjbwwEe2T3vXTEcE76KI0kI/WtkH3l35Rv8MA7RXXz3Iak9RnQW3Xf1SGnaN2R/YPWD
	NDHlaZZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTrLs-0000000C2JB-0trK
	for ath12k@archiver.kernel.org;
	Tue, 16 Jul 2024 23:12:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTrLo-0000000C2IX-0JeH
	for ath12k@lists.infradead.org;
	Tue, 16 Jul 2024 23:12:54 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46GHev6f026959;
	Tue, 16 Jul 2024 23:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	O3bzu4lEl4FrcLmHSyYl+vMEdSRfBEg69MDObo0mrX0=; b=etVMN8nKqSieNDiL
	il31/vE32PH/ng7E/u99/yo8a8/Z5G1ycalIKH5NWZU/CMDIvPnP8MgMR/SXkzFi
	hTbtqM+EgxgBlgnSVw6F5VmN43ADtPnxSwOt5jRCGpah6gcJuFdKqJsWhfU/l91V
	zJmW/VS/4KbGEoYn8rvk5I2ANHPEUs5wIwvH7D46T9PQ569HgXZe39D3q8++4BvS
	SHJv/inaOuJmyWUUnF8pRzSioRDudSNPzxD+BL48JjKSk9uYikpxO2tp0V6ugnAV
	QPd8AfeilsU1QUttSjN1gBbaBkEll5MmZERwLGRMpodKFvAHRquK4Bw1K82SoCSc
	Ls5NQw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40dwfs0juv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:12:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46GNCn3i028142
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Jul 2024 23:12:49 GMT
Received: from [10.48.247.102] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 16 Jul
 2024 16:12:49 -0700
Message-ID: <ba6d7724-577a-4188-9205-58081c84f853@quicinc.com>
Date: Tue, 16 Jul 2024 16:12:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] wifi: ath12k: Add firmware coredump collection support
Content-Language: en-US
To: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240716063932.2627087-1-quic_ssreeela@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240716063932.2627087-1-quic_ssreeela@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PXddbWAuEKNMiKqGr-abucekDmUM2z6E
X-Proofpoint-GUID: PXddbWAuEKNMiKqGr-abucekDmUM2z6E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-16_02,2024-07-16_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 spamscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 mlxlogscore=957
 impostorscore=0 mlxscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407160171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_161252_156660_F6360294 
X-CRM114-Status: GOOD (  16.46  )
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

On 7/15/2024 11:39 PM, Sowmiya Sree Elavalagan wrote:
> In case of firmware assert snapshot of firmware memory is essential for
> debugging. Add firmware coredump collection support for PCI bus.
> Collect RDDM and firmware paging dumps from MHI and pack them in TLV
> format and also pack various memory shared during QMI phase in separate
> TLVs.  Add necessary header and share the dumps to user space using dev
> coredump framework. Coredump collection is disabled by default and can
> be enabled using menuconfig. Dump collected for a radio is 55 MB
> approximately.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.2.1-00201-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
> ---
> v4:
>   - Fixed Kasan warning vmalloc-out-of-bounds in ath12k_pci_coredump_download
>   - Rebased on ToT
> v3:
>   - Fixed SPDX comment style for coredump.c file
>     Changed Kconfig description.
> v2:
>   - Fixed errors shown by ath12k-check
> ---
...
> +	dump_tlv = buf;
> +	dump_tlv->type = cpu_to_le32(FW_CRASH_DUMP_RDDM_DATA);
> +	dump_tlv->tlv_len = cpu_to_le32(dump_seg_sz[FW_CRASH_DUMP_RDDM_DATA]);
> +	buf += COREDUMP_TLV_HDR_SIZE;
> +
> +	/* append all segments together as they are all part of a single contiguous
> +	 * block of memory
> +	 */
> +	for (i = 0; i < rddm_img->entries; i++) {
> +		if (!rddm_img->mhi_buf[i].buf)
> +			continue;
> +
> +		memcpy_fromio(buf, (void const __iomem *)rddm_img->mhi_buf[i].buf,
> +			      rddm_img->mhi_buf[i].len);
> +		buf += rddm_img->mhi_buf[i].len;
> +	}
> +
> +	mem_idx = FW_CRASH_DUMP_REMOTE_MEM_DATA;
> +	for (; mem_idx < FW_CRASH_DUMP_TYPE_MAX; mem_idx++) {
> +		if (!dump_seg_sz[i] || mem_idx == FW_CRASH_DUMP_NONE)

this looks really strange testing dump_seg_size[i]

the first time through the loop i will be set to the value of
rddm_img->entries since that is the value it will have from:
	for (i = 0; i < rddm_img->entries; i++) {

but subsequent times through the loop i will be set to the value of
ab->qmi.mem_seg_count since that is the value it will have from:
		for (i = 0; i < ab->qmi.mem_seg_count; i++) {

did you really want to test dump_seg_size[mem_idx]?

> +			continue;
> +
> +		dump_tlv = buf;
> +		dump_tlv->type = cpu_to_le32(mem_idx);
> +		dump_tlv->tlv_len = cpu_to_le32(dump_seg_sz[mem_idx]);
> +		buf += COREDUMP_TLV_HDR_SIZE;
> +
> +		for (i = 0; i < ab->qmi.mem_seg_count; i++) {
> +			mem_type = ath12k_coredump_get_dump_type
> +							(ab->qmi.target_mem[i].type);
> +
> +			if (mem_type != mem_idx)
> +				continue;
> +
> +			if (!ab->qmi.target_mem[i].paddr) {
> +				ath12k_dbg(ab, ATH12K_DBG_PCI,
> +					   "Skipping mem region type %d",
> +					   ab->qmi.target_mem[i].type);
> +				continue;
> +			}
> +
> +			memcpy_fromio(buf, ab->qmi.target_mem[i].v.ioaddr,
> +				      ab->qmi.target_mem[i].size);
> +			buf += ab->qmi.target_mem[i].size;
> +		}
> +	}
> +
> +	queue_work(ab->workqueue, &ab->dump_work);
> +}


