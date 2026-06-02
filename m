Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F9D2CD5BD1
	for <ath12k@archiver.kernel.org>; Tue,  2 Jun 2026 17:10:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=; b=dpoX2ZN21f24Jvc/pA9B6duWKw
	GZZUsyECeujobSGsUQfX1NLTggr1j7NKDdJNuQLU/+JKffmbrcjJL0Gz68MAs7gaxTEU8jhfD+c00
	RkKupF5eRdSGsBNIRksy/1KE8noWlN1BI1IQsvgTd7JS40g2P3z6lVpCSddN9Dx4HZuMjK+zfoLw7
	Zpk3xZ1aJW4Jof3nN5cy57+wAjQEQ1bWYv4pWL7fIsl3zQXmLCpcklIEnrgVgGSdMyuiLTtPxpMXW
	bnk4xgqVm2XDxiYWih6u0UxiJtsaBkK91bQBMoy6km662nhgc/n2nUA9FCPxxZr8IhKbm8c31hB3z
	fxvDmH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSdA-0000000DYKH-4APT;
	Tue, 02 Jun 2026 17:10:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUSd7-0000000DYJU-4C57
	for ath12k@lists.infradead.org;
	Tue, 02 Jun 2026 17:10:19 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 652CFX5q1854913
	for <ath12k@lists.infradead.org>; Tue, 2 Jun 2026 17:10:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=; b=RvGqCcDNYtozPEiS
	CYLS/1v9wUP7ra0dhlJpkOOhOO9laDsk8pM9hPeXxK2WSDfiJHmrX7eFDeIFjW3R
	Vgw8CYBJaPcJFi2nEQU4j38RE6pFJj87Loajsn/11q7Ti2dR1likcCeJs92naRtY
	Q9lv2IuUqBxXxgwp9gDI3i2H/qdn7wzTWmWW3xr1EQ423C8Rhv+53dkRve0d+xBy
	Eph0XrYHFm+6BXqeZQAtX0KWK+FIA4NgaCjGLSZikyRuE6b9oDJ1jbk1D0Ec7M5C
	CcRXcOkAQDdJZe/GvFazntD3eFruKEWa6xGnpg/FtEAdzmtYkc9uy+3qxq4zvwAT
	RUqbOQ==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ehsf7atcj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 02 Jun 2026 17:10:17 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3074d4102a9so191844eec.0
        for <ath12k@lists.infradead.org>; Tue, 02 Jun 2026 10:10:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780420217; x=1781025017; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=H7lmTUlXBol0pM+UiFPqhs3nQHfdN7vil6lp0MvvsiDlMuSZrXjluZwAJu3oRtRfkV
         AcEVB5GHM0Pr0h3Ip74OoswsJl4ykzJ5Hv6V2N05RQUycjIHfeqFED8TOsE6m3M3xzSc
         eVLle1ETjbijY4sCNcPLjwoPJLkmU4K2Ah9MB1FTZpAXp71n+AqtSCcDGBcK89fohimT
         1ffUamt244LxXurWm3myvsHMOY0kw8LbaRm2q4vPuDbBBPGdQdfweOQCYyqrhaTYcysz
         LwIMYDWipmmbXc9TYunPMArH7Ya/EqErnIt5i8VmhEXGjeRhJL1lrS1DajNnlEv2CE8l
         9RrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780420217; x=1781025017;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0WnpHurriknASg1CchB30qt7X0mCuqO6Pf6V96jiWis=;
        b=X16cN1Inoe+JkpXWTwCph+te3hEi6iSWaslIY4l9AV338oKyhWngb+SO//nttF4j2r
         haIC4C116dH4NK+p1JTjcMOaZE5RNcgBsH5qVwpjOHu3ODSo+JAhbq2BxOZ+QdMWrZER
         PU16xhgVtnBQ78olLsCglthr+4K1htm5vp5HMHFWk7X6fdv3XMDBlxPZlcmiHXh+eTVF
         a72V7sTlCEdfH2n/SfnIxHgYkFyqrDusrmUmlrpd/jmiiakjDJ4eoGryiuApN5WifYts
         2wMvX7C0sNg+vZwAXXyPNoqq49X8+dA+msKeMreBz+JC3N13nWrj+AMRnEmjuzZ7AQKt
         7tYg==
X-Forwarded-Encrypted: i=1; AFNElJ82i7F//GGTEtcBi/PC0beBKtanTcRjIi733Pfa56KAehzMg26VxIFwAHGEoQa5Osyo9JjzSoo=@lists.infradead.org
X-Gm-Message-State: AOJu0YyOIonpxP+6RWDE6PVDAF/KdQVOiMYDFuC5w+Op4zspHkz5e+Vd
	x5NO4DJ3/3VSnmwHywcuV0uBYIFOO2fg7yo0pvaSnOvR4riOG9Iu244bPrII86NJdD5xWcUSJta
	hymsAxzjpRXx+Kow586V1CpREaYO3TfLzFmSE9iSQJKP9msa2nDp30xPRWF2FGxqC
X-Gm-Gg: Acq92OEx5891WX5852SEnVUi/HLtCswucSOKdS5FEVZr2GCDE2XqJQk9ZSAi8PTY+F4
	EOe5WIzXMrVye9v47zndMNo9QLD2GGfGEfm6NHByjYHsJNY5sv5jxU8lrUWimCxLfaY+EMIaXDA
	PG1PgMr2zFdkSWNRIdE0b8tqTNd+3+HCwYe2gKP53K9Bnr7ZmzD5lHkDzINucpzRsY14I+Gddfa
	mSRPg7HLe3+KMf0jtbj5btf7WFUzA9fX/iVQ3RMAS1Hq5Uu4NfOhv72PIW+sLDQPVmBC3Gs3LgJ
	IPO0ZZIbRV9vbKSRT32qYmBYnYbTzvtw8AUBDF1dbxKpcRXFjmDUGGGNqqLc7gQiHZdGO1J+AyY
	gizyO+pDvWmX5oxXUMUKUl2ons84zY58aDBKPB4nldBFuEW/DBN+1RqbwZW1K6EIczV5ozjE7FA
	Xexqoo8S2+iQTD3TE9IxDCI+9R
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020161eec.33.1780420216625;
        Tue, 02 Jun 2026 10:10:16 -0700 (PDT)
X-Received: by 2002:a05:7300:ef83:b0:304:ba84:a0cc with SMTP id 5a478bee46e88-304fa74682bmr8020119eec.33.1780420215911;
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Received: from [192.168.1.59] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-304ed53f002sm12470560eec.18.2026.06.02.10.10.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 10:10:15 -0700 (PDT)
Message-ID: <dc836218-2f18-4465-882c-c41b5289c379@oss.qualcomm.com>
Date: Tue, 2 Jun 2026 10:10:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] PCI: Add device-specific reset for Qualcomm
 devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, bhelgaas@google.com,
        alex@shazbot.org
Cc: jjohnson@kernel.org, mani@kernel.org, linux-pci@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, mhi@lists.linux.dev,
        linux-kernel@vger.kernel.org
References: <20260602160024.1171949-1-jtornosm@redhat.com>
 <20260602160024.1171949-3-jtornosm@redhat.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260602160024.1171949-3-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=WKRPmHsR c=1 sm=1 tr=0 ts=6a1f0e79 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=_dsfnS01iu48ROCZzqsA:9 a=QEXdDO2ut3YA:10 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-GUID: yceX7JaWrbj5rQX56gNw8InrhYFZYunx
X-Proofpoint-ORIG-GUID: yceX7JaWrbj5rQX56gNw8InrhYFZYunx
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjAyMDE2NSBTYWx0ZWRfX4TzwmKeuTTt7
 wWISLl8d/VBG5jH3YBDlbe4wBfaEMBPnrflhk7qAcrbKasdojVcuReevHYlERCd3mu7CVeUWG2k
 cjVg+DwXZWoAehT35Iw9yMTx4DnMxo/J/Oe3G4bAySt2bz0rQfeIzq+m6RibLH2FnKWG48/oG09
 72qCmI8i1CAtx/6KXadLo7ZBJOXyKI455YFhs8EChlw909aWMId1k6fgmJsJBupiVyJoF4EWZbO
 ElimTR3jW6vSq5CAT0njssNiOfgTKsEOIXlNKwnCiTLY27MSLyC37eyJBoWVRM8JrM+d2VWStW3
 dUfzmXmBmJYY7f2VTCcvdOsEqV5GcrEcRioznJx4r1Kg00ducWCj9HNeR7VoevX/bU+YBWH4tn6
 e4IwDO+T26nWYVg6iKDfzW3GYbCpINAGnsS478Tx/HPqua8BS3bEwL+CbXM8hU/X7NzB99kUrya
 XxuRJizdso2n/WKQzyA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-02_02,2026-05-28_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606020165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_101018_049493_AC53E7A2 
X-CRM114-Status: GOOD (  15.20  )
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

On 6/2/2026 9:00 AM, Jose Ignacio Tornos Martinez wrote:
> Some Qualcomm PCIe devices (ath11k WiFi, ath12k WiFi, SDX62/SDX65 modems)

Throughout your series you refer to ath11k and ath12k as if they are devices.
They are not. They are device drivers, each of which supports a large number
of devices.

> lack working reset methods for VFIO passthrough scenarios. These devices
> have no FLR capability, advertise NoSoftRst+ (blocking PM reset), and have
> broken bus reset.
> 
> The problem manifests in VFIO passthrough scenarios:
> 
> - ath11k WiFi (17cb:1103): Normal VM operation works fine, including

17cb:1103 is WCN6855

>   clean shutdown/reboot. However, when the VM terminates uncleanly
>   (crash, force-off), VFIO attempts to reset the device before it can
>   be assigned to another VM. Without a working reset method, the device
>   remains in an undefined state, preventing reuse.
> 
> - ath12k WiFi (17cb:1107): Same behavior as ath11k.

17cb:1107 is WCN7850

> 
> - SDX62/SDX65 5G modems (17cb:0308): Never successfully initialize even
>   on first VM assignment without proper reset capability.
...

> @@ -4252,6 +4268,9 @@ static const struct pci_dev_reset_methods pci_dev_reset_methods[] = {
>  		reset_chelsio_generic_dev },
>  	{ PCI_VENDOR_ID_HUAWEI, PCI_DEVICE_ID_HINIC_VF,
>  		reset_hinic_vf_dev },
> +	{ PCI_VENDOR_ID_QCOM, 0x1103, reset_d3cold_d3hot },  /* ath11k */

s/ath11k/WCN6855/

> +	{ PCI_VENDOR_ID_QCOM, 0x1107, reset_d3cold_d3hot },  /* ath12k */

s/ath12k/WCN7850/

> +	{ PCI_VENDOR_ID_QCOM, 0x0308, reset_d3cold_d3hot },  /* SDX62/SDX65 */
>  	{ 0 }
>  };
>  

same guidance applies to the 3/3 patch

/jeff

