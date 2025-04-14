Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4043C369B2
	for <ath12k@archiver.kernel.org>; Mon, 14 Apr 2025 09:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xj8e5oei6JOdb0HPupXEAc6CgdAdGfN72foVRMbbbuQ=; b=okpsrIJim6ic/+5j+0kb+73GuH
	9BUtpbxtDEgBj8EvzrJkMEGEUTItydo+ir5EBhgR2/0tVAVuot0Aupo720TOnR4CKT0TG82Zzx2Xn
	FrPUeMLfIg1PtqL9s9zgXgbX4CmkO4GsoBU1djzMzIWOuaHw8uqPz9FA5aXqA8xPHLf0FesgSpa/N
	ZaIjeGSaIvcf3BjPLMcS0empv8rvpEJnh7zAdFrhfFAcwuS95CojU3bZ0o4O43f9hkTLi3VbjGtMN
	HoPu8JqlO0h0cyw+SYsjwr8SCL6LdKbEaV+YmCl7UCJsytFhL2yp6viZmA9/b69buGCQZ2oO5BiYm
	3yGKn6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FmK-00000001DQa-21BT
	for ath12k@archiver.kernel.org;
	Mon, 14 Apr 2025 09:06:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4FT9-00000001A4J-2RXo
	for ath12k@lists.infradead.org;
	Mon, 14 Apr 2025 08:47:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53DMjvmQ030931
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 08:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xj8e5oei6JOdb0HPupXEAc6CgdAdGfN72foVRMbbbuQ=; b=DOaKgudEC2b8pseR
	Bu6VyKBn5oSnFnaTg/d8G38T2N20dq24Uy15QQfZXGWrgnQwvULpA9UMSKfJ56mi
	VxYLs987SbeJub/DTLqDd3z8xp7HLaKKMpQx0p8/9NTDA6SDrWLuYhzjtiyg/X1t
	wMCU6tC7zDCvDxWDfG8UIlDai/1+GUgy6w8DkrHjquanQxedtUdUTgGZGGXB6gGF
	FhXazsyrjcbD1/3jLur266GJ1KudFYXImXDz9HUPh3sIF24nE9AAlEngKz1EoqGN
	e5qxgkgY7xcocU7IHWpSlaFCYM+2cCkFjU9KiEXUbQn8piwiVAQOWtcYiaG1dNbr
	VRVfsg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vbygk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 08:47:06 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2240a7aceeaso36095305ad.0
        for <ath12k@lists.infradead.org>; Mon, 14 Apr 2025 01:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744620425; x=1745225225;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xj8e5oei6JOdb0HPupXEAc6CgdAdGfN72foVRMbbbuQ=;
        b=mkvvsPFWgOOVW3cNQatrtNkA+2eFNOYDTp45Q63IVfE7tvqFbeqlDFcEhHcpDu1A0O
         d0Mlu7jPfzq5gOPy7C7cknL2SCd8XlUSz/4J3VbNsgeOyYHUG6vP6vt8LdZePYSTK6AK
         siSqKmJNX3f759qRxmhnh/iqiHe9iyCNTn2cuQ8oRz4M4z5EGr+0qsw6/LwzQVLgaX5e
         IxU3hH1j811AWDVcrQLsx651OWy8nqjeTjMmRqZ/9P0OCeK2P1qWpy2+B7IpjVfWh6Tk
         h2fjcq2/teacNb2GfXKaWdkEZ4UP6WkyuTNkLhEz44tJNomPDaSIu8jHchyqq8TfZ1Yx
         TBlA==
X-Gm-Message-State: AOJu0YySfK0zycMW1YSyDRbjTpDe53b0kY4yVcOv52lF5un6SFN/AA9/
	Fc2HTG05z2KV1QE09QJhrlypPrdwca2X8CcipHFYIUWPDT9rl25K8BmYfrufmDfY52Aw3b2etd/
	tlCxjryyjpqy3rrFtleEDLA0Y/ZNSJnr1kMqMBakz4VTLiFaY3Gz9OSLWPgSC
X-Gm-Gg: ASbGncv0PII/10Qa1J6mdD77Byd8u3vzsiIQYAhXpfK53w0m0FuaTsf0BeMU9fOzxLO
	yoTlEfXCFUd0tRg+X9DN0ck9Wz40ctG1zZbXnKL1PC7zzsUelMH5PPztcrUX0ixvZ0EWqcvl0h6
	J7GbUMlczjqRAGFULmF40CK3b7xH+ASanrEigKWx7V6nVY+bYOv7EEPX44f+n7DD6hNRdD6rdL3
	D+1GhwMXXTruALSUnjRFj59l7Bwoa3fEiDckyFpHyq32AuxsBGO+bSR6daySWrDiVu5621XU24t
	SXzcC9EAHEAQMwo4j13skhu1E3fug9LVLwkJWgyN1UDP41MBmYqZmg==
X-Received: by 2002:a17:903:3c6d:b0:224:a74:28c2 with SMTP id d9443c01a7336-22bea4c3e94mr182893015ad.29.1744620425456;
        Mon, 14 Apr 2025 01:47:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHp7yFwbjgHGKx7tlCiZg+OFqMpG8Hw5702EW89wSfGmN3jPOC8NG+R8fOKfEBZPcmC7RgC0Q==
X-Received: by 2002:a17:903:3c6d:b0:224:a74:28c2 with SMTP id d9443c01a7336-22bea4c3e94mr182892725ad.29.1744620425129;
        Mon, 14 Apr 2025 01:47:05 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b2b6sm93432875ad.65.2025.04.14.01.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Apr 2025 01:47:04 -0700 (PDT)
Message-ID: <897a8b62-04b1-1ce6-bed4-ff2061636ae6@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 14:17:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 1/2] wifi: ath12k: handle scan link during
 vdev create
Content-Language: en-US
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-wireless@vger.kernel.org
References: <20250411-fix_scan_vdev_handling-v2-0-b6740896c144@oss.qualcomm.com>
 <20250411-fix_scan_vdev_handling-v2-1-b6740896c144@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250411-fix_scan_vdev_handling-v2-1-b6740896c144@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: mQQEFl-LqNiiqyoBhKZ2JiRNTqBflutC
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fccb8a cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ttVt3SnfeazVJPRM6VEA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: mQQEFl-LqNiiqyoBhKZ2JiRNTqBflutC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_02,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=722 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_014707_641092_1F3257E5 
X-CRM114-Status: GOOD (  14.75  )
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



On 4/11/2025 8:46 AM, Aditya Kumar Singh wrote:
> For scanning purposes, the driver can use link ID 15 (scan link). A future
> change will make non-ML interfaces to select the scan link. In this
> scenario, arvif->link_id will be used to retrieve the link configuration in
> ath12k_mac_vdev_create(). However, link ID 15 is not recognized as a valid
> link ID in the upper kernel, which will result in a failure to fetch
> link_conf and subsequently cause the scan to fail.
> 
> To avoid this issue, ensure link_conf is fetched only when the link ID is
> within the valid range. Since link_conf cannot be retrieved using the scan
> link, use vif->addr as the Ethernet address for creating the scan vdev.
> This address will serve as the source address (address 2) in the probe
> request frames during scanning. Additionally, use the automatic Tx power
> value for the vdev. As this is a scan vdev, these values do not affect the
> scan functionality.
> 
> Note that vif->addr will only be taken when a valid link_conf can not be
> fetched. Otherwise, link_conf's address will be taken as address 2.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

