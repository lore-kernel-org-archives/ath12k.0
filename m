Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85866C3ABC3
	for <ath12k@archiver.kernel.org>; Mon, 12 May 2025 18:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=yF3H36+walTi11ErOMH35MO4aQ
	YSyxgIYCTa6L7EvCgzyklQ8f7x+g1vUFw1xlbaDFBeNYZ7mcYus1Iki3tnHpNNZx7y+I3hoKjLvOu
	MNGvMmkqTXneeGyQnWXM8Wv6dbpw6+ZUtLtAEzas+lORPEjqecM47wiJZ/uYpAMwQYNXFOku0h/fE
	Mz8/AwAHxP9pFQkyRnuv1N9I6Y3KDhFiGf+gXimNy4b34/If5Wbz2vdcMvLddDCMk1hMHh/ewFVh7
	YHKGzvP0EU87VnQO7QEIO+/iy0QIYzOne6Hp4HWlwR1SxVdLqKQI1ly/R2GNmDLK9iW4qn5LBOxbS
	u6Q5Pkvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYM4-0000000ATCY-12CQ;
	Mon, 12 May 2025 18:58:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEYAw-0000000AS3V-3rFP
	for ath12k@lists.infradead.org;
	Mon, 12 May 2025 18:46:56 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54CDdTwI012023
	for <ath12k@lists.infradead.org>; Mon, 12 May 2025 18:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=; b=W0l+3+APuqQo0LFX
	g236I3NUxXGKMXbpA9Ke8JlmNzDqNPDyW4VzT/UwxtmB7CTbs6741vrCtp3yQhxv
	LE3WZP5kQs2r/ac/oIMXrwbK8yZqcKruQ0t5vn32fCUeGvoPyVAGhNxk0dWJJ1UU
	RWjxbP/p/7x8udGOocwqsc+TUG+5tcNpSSQJjcI/Z2mlLNLKMp+0AZ2bxsGgHCr5
	v9gT2V+ETI9JA/WGD4qw3d86DbfmQicXYFccIp/6wsOBKLbynlBxgfI2QOT7Rwz6
	x3foFKY+dql18044P/cwdSvDVc+13ffx1rPJUwChZaXZ4Iw2xmX6pFB/vfJAMgw2
	Q8wYWw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kc3mt46u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 May 2025 18:46:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22e3abea7e8so50658465ad.2
        for <ath12k@lists.infradead.org>; Mon, 12 May 2025 11:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747075613; x=1747680413;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/r5mtaG20KhfYaNuwC8Nolf7zQua6agNHT2giYdPbbo=;
        b=rIYjkeH+X6aayZr30FWzmAHkAIfRmXvBacyzo2eJRjnDKsBok6ccy2TIKRYzjUmM7g
         BB1RdqnS4a8PmU4Nbp4xGChc9O2D8sUtVNU8ntMdLq5YO+0rJcWYX5LI4AiqhgrvSgjx
         yd5Pc1z5vu1Pi+800U/r9PjUgRKkMsnjrkJ6kPX9AE2ntDckZI+9Yol+LGjwwpczZL1o
         FJUBMvS1O1MMadoRgKKZaZolV/xJsChDoVoBhgs+R7jfLBKLvY3RMA83SFR9hVstPl03
         lHUsp0VKFJ5CdxTAUvG1wrC1G+POAZgvK2Kjoj4e/RgAKSX4Mg6bRmipDPFwGjbb6v1K
         QU5g==
X-Forwarded-Encrypted: i=1; AJvYcCVzkOYfT300/WxvJ9wGlNotcJ8FlWXJBygk+C4oLthf45w0PjFIVdzdCaPSrZvqF2C2DjeArnA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7GXZzVWYSDhadFogmlLM6bofdJGYtoWfqGglcEfiDvbPUVrrb
	UuL6FHhSSNDSk566HEWIgbfPWjegxeKy0zFqNxJzrxQm56h2kb3nydQhfJYBTcD/flzXnlxKC4A
	OnQRQvk5eHJaP8bfaXPEtHE7jKVP1mHGZENjWHycT3Azys9vY3gMvLREQ8GQc
X-Gm-Gg: ASbGnct6gq6o0jHn6vD/ZospSBNYOWARx1JZmuMUqwKr56oDBY3Wb3aAdaNoAVGVT7v
	pU/0TScfj08jQLZmFKb8kDpd9O8peZTEiIgGyhNB4QjJOvd9yaMDXtUAQhhnsI/9OJBRaTP6pFy
	TeKKveUGbrH+TDVNkd8pgHw4QLZFSnn187+vcZ5sWLrde9ErLVRFU20aucwlRBOyV6gL0AhrWhb
	SuRV8YU2od4DQDpCaGItYoPIRD/37qYgyiThnRuY2M48pWGkJAYkYECBNoeUjmOvjrmuAgs8kt6
	Nzp9gA7xD5Y7YNMdAVRErMZpWJ1kfsC0Nda2DzuZIB9sIe0M1eGOB7RBtzycQQ==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280715ad.22.1747075613199;
        Mon, 12 May 2025 11:46:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsWqOd3L30u9cjxgIPmURHi+KkJtpXwBIuouO1S+U1W3n2h4To43nTOBZ4I/fyhCvVNGYpGg==
X-Received: by 2002:a17:902:ce86:b0:223:39ae:a98 with SMTP id d9443c01a7336-22fc8b56fdfmr213280045ad.22.1747075612588;
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Received: from [10.226.59.182] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7544f5esm66669185ad.36.2025.05.12.11.46.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 May 2025 11:46:52 -0700 (PDT)
Message-ID: <4a6b83f4-885a-46e1-ae31-21a4f3959bae@oss.qualcomm.com>
Date: Mon, 12 May 2025 12:46:49 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
To: Muhammad Usama Anjum <usama.anjum@collabora.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        Youssef Samir
 <quic_yabdulra@quicinc.com>,
        Matthew Leung <quic_mattleun@quicinc.com>, Yan Zhen <yanzhen@vivo.com>,
        Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>,
        Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
        Kunwu Chan <chentao@kylinos.cn>,
        Troy Hanson <quic_thanson@quicinc.com>,
        "Dr. David Alan Gilbert" <linux@treblig.org>
Cc: kernel@collabora.com, sebastian.reichel@collabora.com,
        Carl Vanderlip <quic_carlv@quicinc.com>, Alex Elder <elder@kernel.org>,
        mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath11k@lists.infradead.org, ath12k@lists.infradead.org
References: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Language: en-US
From: Jeff Hugo <jeff.hugo@oss.qualcomm.com>
In-Reply-To: <20250506144941.2715345-1-usama.anjum@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: ZJzddlF6QC0btgzbls3vFp7bmQOYX35h
X-Proofpoint-GUID: ZJzddlF6QC0btgzbls3vFp7bmQOYX35h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDE5MyBTYWx0ZWRfX80W7aZVygWK4
 NZOWtqdtSaUAO4ckVQv8avrsRQ6CLKo5NaJjvxGpk1UBg6ruae67tAporl6WHnx79ow/0A6pgkE
 PgmykWYgos6KWLWmSkBMjWqxe8J+4it+9PKL8JPLlcU+4r2y6t27rpakkGuhS5wVMvIocl8q5cf
 h4pTCzeQcHowzcuI85mkAkQMcA7zbCMnF/xtUpXfMbXKbsXQpgplFoh3fEt2tzooywnluJEzseH
 X8x3qxX4m3O5qkbNMRLHEsKWV+r+TywXjQ4lD9gqtBjGeXuUd5MLg0zu5F8POUhSmLhcAe9w61c
 lQfreVUTYCjL9zE2IvBQ8qXy1lh5e/jRr0k01U4TBAPoCQ+OZ8X0f8DqUFFcAI9P+3bO23oni15
 7KNxx5t5aFaMl2qNNqrDFi2lxZ9OxJhz5mZ+oCK60hbfbGygTlD2YIGnb/xQqD+rIMBPLuqP
X-Authority-Analysis: v=2.4 cv=afhhnQot c=1 sm=1 tr=0 ts=6822421e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=mx74GWaVK5euFb1038QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_06,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 mlxlogscore=999 priorityscore=1501
 impostorscore=0 mlxscore=0 lowpriorityscore=0 phishscore=0 clxscore=1011
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120193
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_114654_967540_F3FEF0DA 
X-CRM114-Status: GOOD (  22.18  )
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

On 5/6/2025 8:49 AM, Muhammad Usama Anjum wrote:
> Fix dma_direct_alloc() failure at resume time during bhie_table
> allocation because of memory pressure. There is a report where at
> resume time, the memory from the dma doesn't get allocated and MHI
> fails to re-initialize.
> 
> To fix it, don't free the memory at power down during suspend /
> hibernation. Instead, use the same allocated memory again after every
> resume / hibernation. This patch has been tested with resume and
> hibernation both.
> 
> The rddm is of constant size for a given hardware. While the fbc_image
> size depends on the firmware. If the firmware changes, we'll free and
> allocate new memory for it.

Why is it valid to load new firmware as a result of suspend?  I don't 
users would expect that.

> diff --git a/drivers/bus/mhi/host/boot.c b/drivers/bus/mhi/host/boot.c
> index efa3b6dddf4d2..bc8459798bbee 100644
> --- a/drivers/bus/mhi/host/boot.c
> +++ b/drivers/bus/mhi/host/boot.c
> @@ -584,10 +584,17 @@ void mhi_fw_load_handler(struct mhi_controller *mhi_cntrl)
>   	 * device transitioning into MHI READY state
>   	 */
>   	if (fw_load_type == MHI_FW_LOAD_FBC) {

Why is this FBC specific?

> -		ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> -		if (ret) {
> -			release_firmware(firmware);
> -			goto error_fw_load;
> +		if (mhi_cntrl->fbc_image && fw_sz != mhi_cntrl->prev_fw_sz) {
> +			mhi_free_bhie_table(mhi_cntrl, mhi_cntrl->fbc_image);
> +			mhi_cntrl->fbc_image = NULL;
> +		}
> +		if (!mhi_cntrl->fbc_image) {
> +			ret = mhi_alloc_bhie_table(mhi_cntrl, &mhi_cntrl->fbc_image, fw_sz);
> +			if (ret) {
> +				release_firmware(firmware);
> +				goto error_fw_load;
> +			}
> +			mhi_cntrl->prev_fw_sz = fw_sz;
>   		}
>   
>   		/* Load the firmware into BHIE vec table */
> diff --git a/drivers/bus/mhi/host/pm.c b/drivers/bus/mhi/host/pm.c
> index e6c3ff62bab1d..107d71b4cc51a 100644
> --- a/drivers/bus/mhi/host/pm.c
> +++ b/drivers/bus/mhi/host/pm.c
> @@ -1259,10 +1259,19 @@ void mhi_power_down(struct mhi_controller *mhi_cntrl, bool graceful)
>   }
>   EXPORT_SYMBOL_GPL(mhi_power_down);
>   
> +static void __mhi_power_down_unprepare_keep_dev(struct mhi_controller *mhi_cntrl)
> +{
> +	mhi_cntrl->bhi = NULL;
> +	mhi_cntrl->bhie = NULL;

Why?

> +
> +	mhi_deinit_dev_ctxt(mhi_cntrl);
> +}

