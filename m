Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40DAAC4450A
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 16:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=REdpF1hgs8gzXS/McgKrQMBrhboqQcgPf0mwnfMcej0=; b=Vot37KJw1Z87pgxFdDOIG8T743
	UEf+LsSdkWWdYwH14k+GvYv/LZW+Un84+Mrx5bbAkdPCHwKeXbyCaA1ObMElbjL8sRYsghmW9paC6
	rpgOG3d4L2Owz29KmTfhKreqdOflyTtlNn+nzlkGhy8ILdAPC7oZtL2EojMctK7eZTl7iRrWgGiTB
	WGlN3Y+XPjhznvxoqIVmOOSDwQNw6zUaVyossci4hOBat4pukcJHDo2Qe88hg8oVbF9rtx3dPj36l
	u7YtoX7VC3/2MNg5U2m/E77D6v3Dg1dZ9i2/8lWWohzYHAwwQkAE/COE11hjJspWlfirhwb/yw0MO
	yFEws6BA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgRs-0000000Chmv-3ymB;
	Tue, 14 Jul 2026 16:57:36 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjgRq-0000000Chlb-04IO
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 16:57:35 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66EG7H8q879919
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 16:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	REdpF1hgs8gzXS/McgKrQMBrhboqQcgPf0mwnfMcej0=; b=bQFP4djAGG/1sbTh
	uKgRQnW1+GWgIBQd9iO8skFwpR3iVApImo4aQ5oyUTiR8WMT2z0Nbyh2GXfYjyF7
	NziY8I+Mv2kL/cAYv4s5T8CT8DSeogw4PtSC8wl6srY6xNpdlF6E++RN/YECMMy/
	Hl/TVkar6k5Wt2rNX9wwwQ3Pp2TBUUOSc9UbSSI5HeFCXIoyByS+xPZeLiQBHEBJ
	ghJ3Akg3/cT/F8UsCYlBDRnHkeFrVjnUNnM9u1Vesdl9s0uiSewM1PejJCaLwMVV
	gempb5wkt65b0IJUTtFMgKa6RVky3l6YZaNIEU0VbrD1JFltXuIEE+jcoTo3U6lU
	rLqxUQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fdnp0h0xa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 16:57:33 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c8894570b58so1024188a12.3
        for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 09:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784048253; x=1784653053; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=REdpF1hgs8gzXS/McgKrQMBrhboqQcgPf0mwnfMcej0=;
        b=A2zxwYXRkbz42OmZlQmoiCQvHAtJtTYycmYK9XY5yjyjuNJUMtsY6qQmYvl55asJ7P
         BTp+5A2onE/m2U3cjc4vykqD2hA7FVCm/SjiY2Dpc0OpEPNp5QLRHJ/zVtXu0KwYfLEk
         r+u9ef1XhDPMxqrvfHtQkXCy/Gb3cs3lV7Sws2N1eCiyLr0z4VFjtonRgLc3S7xLNP0j
         fhx5jPmOhAaY7p6B/xkWAaq9EvEbDMlQdVxmANl0TGn0hh6Uf4XRJrfvYPjYjfaZY3f5
         sMISyGX5/1EIu3rvAgq/3OEsdwqJTZjt1hrx9Mu1Iz2D447r3jDqYGrE4IUST4/3bPak
         TOpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784048253; x=1784653053;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=REdpF1hgs8gzXS/McgKrQMBrhboqQcgPf0mwnfMcej0=;
        b=AOD+RMY0Q7+3XKnRc2AVJfG4vFw1jbXgvZ2siN7QBiTp9tsF98GyETSZqhQ9Nj8lwB
         /PeAVNQiKXSLI2tyNmxm+C1xwOquW6YDHGJGWsaA4Oj9dGsG6houl19B8X8K8M3sohRH
         nJScDFx3C98eIxderzrej4Ky/IwRoh0atnY9O4wMkQJDKaOHJQ3tC4injQtY+dj1feCV
         xWmNMM/sJcTrinBo3vjTaBe9D4ldk074GCDBETsJZ5oSRta5u0c0gjJeKcCB4kBpZYxh
         U5pAF8JpqEmRAMzDTQhxYN1IVUxWgG1KwpuBdwB+PsbTobgI8M8vFn2uHNf8A62QmXBF
         aLnQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjoAI00ry4Ncm9lbRrbaTMEYWcsdl77qO/LagtWJaZ42RXcwHmIPU4rk21o2qS93WLi1oWOsA=@lists.infradead.org
X-Gm-Message-State: AOJu0YxSd9z3VMJHYVryFDKZW9CativmidvmLxXqhyo3XaC6GXjJOjCJ
	wkEVXXMTP9y6u1a9tyujG+HXKC0i6QpVRylLls4vw3r16i6va2mxwm2IAjU4RlsBeqyTNt38LtG
	VDkbV2hcRVlOcE7EIPvH1cCTDeqyvuTgm6R+yMA642S59os9Ctj6i2loHKlAZmsxc
X-Gm-Gg: AfdE7cl6a91bO9/plF7wSXwRFBZU112AQMm0QvrcXln+FRC71Bz0mlP1ynuSNulADPu
	wgVPrc83eneRXSkj+k4EN2Bj8Aywjxh3h0Ewal8eeyiPUi6SUJJOo0wU+gd//FMqb7s7RvE/EbL
	YWYIj5xkys83Lxytnu1BA/REvRhPEll9tDR1QIOb/jthpSNnDWPDd6UO0xzXXtv0L/ALMjt09RZ
	KsbJQ/xIrADxv2PAqU6DD/1VCEfkDkBWdoL79hlrJuzBlwOaLdKjxS1/feyZL2ka6M/nLTEF7zk
	xXxvK53aYnNOeS+fCb9jr7osmcYtjoQ0aC3DXfoLxcTjErREXpu6V7jVtiw7Sqf4AF9Fpw1lRG6
	pCyIBT4Xc0rpbhUC4qYtqWeY6kAbb2+GXTLOs4I0N1vhN2ZMQk3gbo3Q=
X-Received: by 2002:a05:6a20:c784:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c1108c0142mr14583948637.22.1784048252896;
        Tue, 14 Jul 2026 09:57:32 -0700 (PDT)
X-Received: by 2002:a05:6a20:c784:b0:3b3:216b:274c with SMTP id adf61e73a8af0-3c1108c0142mr14583921637.22.1784048252447;
        Tue, 14 Jul 2026 09:57:32 -0700 (PDT)
Received: from [192.168.11.107] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31174a583bcsm88739228eec.19.2026.07.14.09.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Jul 2026 09:57:32 -0700 (PDT)
Message-ID: <0fc97639-c4ac-4dae-9ce0-a80924c24f41@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 22:27:27 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID in
 WMI scan request
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfX1hnC1jetcEyg
 RnHIJsXP6hR1t3bVpbSJK7RUkqoGqwY9NVdbbzBk12HQqZxUr+GBvXS0jX+PiW7UE1rcmnQ/dZ3
 GDI4P+/NcBc+fEyTFsNtle0PbvLU6t0=
X-Proofpoint-GUID: Izpu5KvwtIAQhxv3QzksDv065g2rh8Me
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDE3NSBTYWx0ZWRfXzfTtZxtxxG2c
 Y/zZQa9lkDXaaXwJGxyU7Ul51+30tR8XTaRMpAId76nFbh4emsLiHsCTjJYABEGFJpfnUkNuWHq
 3Si5cwGVhC5px7MKK1RnBZJvpZiAY2VQRn55fx7/f9pZjZlxh4gubzPktvfl3EAQbjiayaZoHsA
 tYL3ym/RTKJgboeSnDy0fTQI1ulQUc6VUjSFNQSP8RKJI8UQOs28WEN/C9K83RRLx9FbEKYg8LD
 qXGY5JvpazeJGfhK0htrqOsJ3MJTuH/wM/fZ50Hno1ksEaUbMFviX12SvBtxosu19le2rNmHg9X
 tJOM3lXrSFN/CUmFIuVC7jkQVeV4kwAWMz4fkY6/zz8i8mNgdDlG2sU18IPt9a5X+th+fFrUd7X
 mJMKZ86NMb4GX9ImYkZf1u/FVbVigdqnLfzgDsVFdWIBmSI1eIWiLV8M6zrZXrFxi/x68j1ETM+
 CAfdAf8Y48zfEm9Rb3g==
X-Authority-Analysis: v=2.4 cv=FtM1OWrq c=1 sm=1 tr=0 ts=6a566a7d cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=GL6iRD3gBWkkJquUCRcA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-ORIG-GUID: Izpu5KvwtIAQhxv3QzksDv065g2rh8Me
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-14_04,2026-07-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140175
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_095734_067817_4097CCCC 
X-CRM114-Status: GOOD (  10.14  )
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

On 7/13/2026 9:45 PM, Jeff Johnson wrote:
> Issue was reported in ath12k, but exists in ath11k as well.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
>        wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
> 
>   drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
>   drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
>   2 files changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

