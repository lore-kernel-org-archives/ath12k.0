Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EAADD29DD4
	for <ath12k@archiver.kernel.org>; Tue, 13 Jan 2026 06:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MI8oiTkOeCtcOQFZJtHObjl2m0kFB8JOO95rG6suu88=; b=X5FtsZkORxae0qocZDlbUhii+M
	DDbzoSmh4VqHqQV/zLJ3O+7+kmOn+ogthkXJNU+J5X2FflQrFW2pCCia5KP1BF+Jg/6rHKHi2QXG2
	wvqMfh68+CT/T06OW0hqJdSXLxck7jidep4G0uXvz3d7wtutFn1S3YYu2tbiYSZPGdGrBNAotfMlK
	W3t+HVUhcP02gL88n0em0TO4JelSB4MAr3iDjJ7ZQiANauYdFf61XvfJekqz7xLqoyUSFbpFhdDxS
	Dqop7mKSoUBV41nxpyOE1dQWstFRxg0NbwS/QyK/LryGpI+NEXme4lDZeef1suU+jdrG3mQvWWQfg
	jUeqylWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXy0-00000006bI4-1L3V;
	Tue, 13 Jan 2026 06:33:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfXxu-00000006bHY-3F4N
	for ath12k@lists.infradead.org;
	Tue, 13 Jan 2026 06:33:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60D5nUWg3735127
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MI8oiTkOeCtcOQFZJtHObjl2m0kFB8JOO95rG6suu88=; b=puHPHwjbN5nyApyR
	tQUHmpnH0BEkQ6VXOvDq++JQBMIMvkwp3VjxA+uDKokis8fgYrztqBPPENHl15KX
	om65OI7UDr3dt3GqlQtiNGwU34MkkqMlk/uUB5rfBtMnmQRv4QUlhNj3wskuDVNX
	PxVLkd7UvxBE7291sdc/knwZvPRNVuQExg+RDP9/J4J91Z4w/4pW3BJDQhkG02kw
	UicK1IwzBZdAufttYFi6Fimn2dxV6De8qFvEQ1iC6qcTwMvmiQLe77Da7JDFUrkz
	rOMiVr/SVc0X5eBST1HaS3JqXiOIp/NodW9EssgtV4n9jkI2/M48NOLRyX5x49CP
	eJTFTQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bng8783dv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 13 Jan 2026 06:33:17 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-7f66686710fso13664375b3a.3
        for <ath12k@lists.infradead.org>; Mon, 12 Jan 2026 22:33:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1768285996; x=1768890796; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MI8oiTkOeCtcOQFZJtHObjl2m0kFB8JOO95rG6suu88=;
        b=jD1zmEpaoZLnYzMZ5LdoYRIqm/yOx5Wm+RPSQQWWeaj59+raRVtSFdQg1SyvudD7aZ
         QHt1ZtaVQHU0A4oWijtHkxSrpbypFE/BonHuDzgTA5RyYbO2qFfV8Vnq1bVQhKaSW2fK
         01Cde4toZW1TSaXGIMgQXNCO2ygeJjVDIXrrHNY+tFMPFPSuFMgQgsU2uKDjE04OxImi
         T3TzpmIK1gUKcaSbNQAwuk73VUOZ96D/frzK4zNRt/5H5c/QsCpJOdJg38fq+Hy5ciKO
         XATvdkdDRJClG+7HadvouzTEJ5yef26OstPGj8GVlxTK2Cl0Rp010O6PbEwZYdeW+Soq
         suDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768285996; x=1768890796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MI8oiTkOeCtcOQFZJtHObjl2m0kFB8JOO95rG6suu88=;
        b=kg+ygVSpStgfMIevYC140+g7AoVUbJrbc/k1nMvcrhGg+gSOB3UU4MVKRtXYc/ivQh
         ZN2PH9sJ/ojvqUsAJbUOWvdXlrmJa9n2g4zn+WhCDJrqsueZTJpj2AKhkthl5SlpDdDZ
         heqNjfy6Q0uBp4w0U3oCZdBtf89bxnRB1Zo+pnVTC6XSEHN4qXWGTyryeXqSnqUJrwCK
         i/3+GLMoHjUAj6gk622B8HdAm5NpiAOfIEMAjvhGAHYlyqKhISPT/6x8Eh3RZT3cL/GK
         t2nvVAktl9cQfixAjos4a46pzfiSMmOP6Y+GD3zWNWTkUcuJhVdjInTWQDzPcZhPVsFe
         xtnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/5HNBLm4bcOHf9l0XV6TNgd4yDdSvTs5NTSo9GB/qs1zpDWycURbh55M0t1RTnJ7oCaF5nPY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9/bR29Hkv+ahs3z5UWcw4XQswM3NRAKyyj69go7HlHX20jkSY
	aRCBIGRC5pI3migJwZVvaXQscRMJKeeXyNS7+j7p22fbhspykbS+qejlqWA+nu+rts0magT/JFO
	pgPHWRhJIB1fRepn3Fx85mzqdnLCpDftgI85boT9ah75lD1x6r5IJKtq3oVVboWka
X-Gm-Gg: AY/fxX5QQDd+9PkKWlNTU97tysiA46nKgmbgywpEmc1LfGrVIwnKDfQtC5JoSMsvDk+
	lc7oZRz5TzR+Jf0ghPRJdB5nHLhv1llu9h7bVc49lOuSjCR2yeL7PrJdvyHUusTN1vaj2dP1QE7
	x5W1FcOfCQSM4AVyoNYFbNJwQUVD8PL2hw6WL98GGTb0VT8Z/2D67U1xsFeB4HqtQLnBeiOMokH
	jCKzI9oQovshUs3TLX4yVeC29W85uzlvMtMaeUhEYtIJhph8mV7NI3QGNBjeyN4ghO8QasdFGC0
	23OX1i88QUx0QiPH8+l7tjfro0ryJxX80gwi7NkT2C7jVgs3wYWY5svf7xgNBP774vfbCXsiWj8
	mKoFMVm6eUwIcF/3KftIN36Aty4l4E4teIZIIoH8TBWlp78ipVFSDtVM=
X-Received: by 2002:a05:6a00:1d13:b0:81d:a1b1:7324 with SMTP id d2e1a72fcca58-81da1c0bae6mr13647239b3a.58.1768285996288;
        Mon, 12 Jan 2026 22:33:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEkCRf1fYLzHMkPy5u68wdnPGufOS/ZTPw1Fbjpf4BI11YJ0COBi+ayPIqXzVymTDC61kmw0A==
X-Received: by 2002:a05:6a00:1d13:b0:81d:a1b1:7324 with SMTP id d2e1a72fcca58-81da1c0bae6mr13647220b3a.58.1768285995812;
        Mon, 12 Jan 2026 22:33:15 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81d7d2cb2b5sm12194810b3a.43.2026.01.12.22.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Jan 2026 22:33:15 -0800 (PST)
Message-ID: <5a474fb8-95ad-4b98-9ed3-99f80dc41529@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 12:03:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2 00/18] wifi: ath12k: add support for QCC2072
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260112-ath12k-support-qcc2072-v2-0-fc8ce1e43969@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDA1MSBTYWx0ZWRfX5O2Argqb/w1L
 XMZ1un8yrMJVII5vGGf1/Q88b3iVm17dBXSL45G6hfG31OszhgW3VGpsrutd06xnfkfuBCp9cLj
 B5EqUABce8wfmfnWcNQWniadLhqcDOagxQGQQnDjAXjy0r9C1rPTcRZ/u8riBCv1EmvVfyC7jTi
 h2kXhAY2mrbh0X81b44HXdhc8YVS/IdRqkttS1/iUOEu9TYKjtjUOvyao0l/RPPbp1rrU9QuyEu
 BswWE6GP/tBX3/FXRUMVok/HJFjBp+8ynMF56LVMTc8nr/hHmN0MGogGIhVVhKFPGx9/+Gka5QA
 6qEQWo7dvQ9+KLyiYhbD0nb2YKCKGOK+V5E9AN+MIps7arJWHRLRvQuXO5ayVnmzWuR2l8kgb5U
 tVGIoR1DCMBpXY8sNDvhRsXA/9XwmEGYPyNqLs3AnRMUCdWNyN+zatOhybGdwW/2yEHmA3thUdW
 lkVScSwU6R/BoqZSdAQ==
X-Proofpoint-ORIG-GUID: tNOS7KlGrASJ1Yfw9diM0t1nJuIIsOFN
X-Authority-Analysis: v=2.4 cv=IOEPywvG c=1 sm=1 tr=0 ts=6965e72d cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=4yKLGjra7TlDbw-xlBwA:9 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-GUID: tNOS7KlGrASJ1Yfw9diM0t1nJuIIsOFN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_01,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 priorityscore=1501 clxscore=1015 impostorscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_223321_012986_FBF27DB3 
X-CRM114-Status: GOOD (  22.07  )
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



On 1/12/2026 1:06 PM, Baochen Qiang wrote:
> QCC2072 is a PCI based device that is very much like WCN7850, the major
> difference is that QCC2072 has only one phy hence does not support DBS.
> Due to such similarity, lots of existing WCN7850 code can be leveraged.
> While to handle the difference, separate operation is added, necessary
> configuration is changed.
> 
> Overview:
> - The first 6 patches refactor/fix current code base to prepare for QCC2072
>    support.
> - Patches [7,8/18] add hardware registers and parameters for QCC2072.
> - Patches [9,10/18] add support for new QMI memory type, new firmware
>    download etc, these are specific to QCC2072 hence necessary configs are
>    added to make sure other chips are not affected.
> - Patches [11,12/18] add new callbacks for QCC2072. These callbacks are
>    actually taken from WCN7850, with modifications due to the different
>    HAL descriptors.
> - Patches [13,14/18] add 32 bits variants for QCC2072 REO CMD/status ring
>    handling, as existing 64 bits functions don't work with QCC2072.
> - Patches [15,16/18] contains changes required by QCC2072, but those
>    changes are made common to all chips. They are not expected to cause
>    any regression.
> - Patch [17/18] add QRTR node id register such that QCC2072 can work when
>    firmware-2.bin image is used.
> - The last patch enables QCC2072 support.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
> ---
> Changes in v2:
> - drop MHI dependency as it is not needed any more.
> - drop '[PATCH ath-next 09/19] wifi: ath12k: advertise standard ELF image format for QCC2072' as
>    current MHI implementation supports detecting firmware format by itself.
> - Link to v1: https://lore.kernel.org/r/20251218-ath12k-support-qcc2072-v1-0-87928cf8e547@oss.qualcomm.com
> 
> ---
> Baochen Qiang (17):
>        wifi: ath12k: refactor PCI window register access
>        wifi: ath12k: refactor REO CMD ring handling
>        wifi: ath12k: refactor REO status ring handling
>        wifi: ath12k: fix preferred hardware mode calculation
>        wifi: ath12k: refactor 320 MHz bandwidth support parsing
>        wifi: ath12k: fix mac phy capability parsing
>        wifi: ath12k: add hardware registers for QCC2072
>        wifi: ath12k: add hardware parameters for QCC2072
>        wifi: ath12k: support LPASS_SHARED target memory type
>        wifi: ath12k: support downloading auxiliary ucode image for QCC2072
>        wifi: ath12k: add HAL descriptor and ops for QCC2072
>        wifi: ath12k: add hardware ops support for QCC2072
>        wifi: ath12k: handle REO CMD ring for QCC2072
>        wifi: ath12k: handle REO status ring for QCC2072
>        wifi: ath12k: limit number of channels per WMI command
>        wifi: ath12k: send peer meta data version to firmware
>        wifi: ath12k: enable QCC2072 support
> 
> Miaoqing Pan (1):
>        wifi: ath12k: fix PCIE_LOCAL_REG_QRTR_NODE_ID definition for QCC2072
> 
>   drivers/net/wireless/ath/ath12k/core.h             |   3 +
>   drivers/net/wireless/ath/ath12k/fw.c               |  10 +-
>   drivers/net/wireless/ath/ath12k/fw.h               |   3 +-
>   drivers/net/wireless/ath/ath12k/hal.c              |  46 ++
>   drivers/net/wireless/ath/ath12k/hal.h              |  34 ++
>   drivers/net/wireless/ath/ath12k/hw.h               |   2 +
>   drivers/net/wireless/ath/ath12k/pci.c              |  17 +-
>   drivers/net/wireless/ath/ath12k/pci.h              |   7 +
>   drivers/net/wireless/ath/ath12k/qmi.c              | 180 +++++++-
>   drivers/net/wireless/ath/ath12k/qmi.h              |  16 +
>   drivers/net/wireless/ath/ath12k/wifi7/Makefile     |   3 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c      |  62 ++-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h      |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hal.c        |   8 +
>   drivers/net/wireless/ath/ath12k/wifi7/hal.h        |   3 -
>   drivers/net/wireless/ath/ath12k/wifi7/hal_desc.h   |  33 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.c    | 503 +++++++++++++++++++++
>   .../net/wireless/ath/ath12k/wifi7/hal_qcc2072.h    |  13 +
>   .../net/wireless/ath/ath12k/wifi7/hal_qcn9274.c    |   8 +-
>   drivers/net/wireless/ath/ath12k/wifi7/hal_rx.c     |  97 ++--
>   drivers/net/wireless/ath/ath12k/wifi7/hal_rx.h     |  30 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_rx_desc.h    |  17 +
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.c    |   8 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_wcn7850.h    |   1 +
>   drivers/net/wireless/ath/ath12k/wifi7/hw.c         | 101 +++++
>   drivers/net/wireless/ath/ath12k/wifi7/pci.c        |  26 +-
>   drivers/net/wireless/ath/ath12k/wifi7/wmi.c        |   5 +
>   drivers/net/wireless/ath/ath12k/wmi.c              |  54 ++-
>   drivers/net/wireless/ath/ath12k/wmi.h              |   7 +
>   29 files changed, 1162 insertions(+), 136 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

