Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 882C6CD4F26
	for <ath12k@archiver.kernel.org>; Tue, 23 Jun 2026 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=; b=knJ1pG6CcCpEpvVYU/HD/zjNC4
	NzACcK5mWQE9Cx4DRjWTsJIuwr95UYjYiE04qIpofAgvnCy2lcoZuYzU78rNy30Ulq/DZaL9Q8O4a
	h2W3ikCTlMhL3P1YCIXe6sCC6n3ucaWPO5PY/1rFmdzBytY0DSdmjJlj/eW6vt8QfxbUuWpykTNLI
	cs/zU36bSI2G65UsrnoQmea3Pj3Pe/NrF3DSQWhTa5wDQ9qlUN/bPFOONf+vnc29pAzxixY2uaYgg
	huzMJMa6U/jfppUt2iOluoXbeRk7I6T1r7Geo/KAIPIsTYfw/Mw0sXmj1OPpgLicEygsVjlON6Ai8
	FeMd4lKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwvA-00000005wZQ-0QSw;
	Tue, 23 Jun 2026 08:55:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbwv7-00000005wYw-1VQG
	for ath12k@lists.infradead.org;
	Tue, 23 Jun 2026 08:55:50 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65N6dR703631327
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 08:55:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=; b=n3ubBrYSXQwWXHI+
	gn4nI/HCD2XOGpUVDc68k8FNLl8ckvJt4bupL2cd7rzU1Tin2PLb2rPXEosaEckO
	4G/0VFrJvimVOnmWviT/Szx0CzORjh7dT1ftcG4i6tl4+rD4E0DLG8m50AjpaXMg
	6QDM/OK3nBsZm2jalDsrHNDWxOqGfTbz4XYMUCRZka40YX3x67AEfBkWerBY6nds
	ZDELP9IcbVG2cHuwC53wFSF0RIy7k/vdXmDtkPfiyvYvt1/3+BtCDW/5fTI6Zyzq
	I0O/djCufRrhZ/Y/3VZjYYCatRvbDj4XeueKoJgV3jc5pcigEWnudrY5+w7Rp4DM
	u6gOjg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eymnvrkf3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 08:55:47 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c2c98c1be2so45953115ad.0
        for <ath12k@lists.infradead.org>; Tue, 23 Jun 2026 01:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782204947; x=1782809747; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=ZlX8okO6aWCKpc53Ufyr+5iBFhdLFic2naV++o6/4Dv2zQWD53yiIh1VDkNvvyzy1K
         B78tp/tLD4wZ4+cmSG3F0EcGdMYFTf2ex3c8Mbj1bnmMhbJSybLSC/4ooD2lc3j+TFK5
         cvggD0G0uQtPf4cBbFGJ0+RNLqRyDu7z7qwGTVy2yLKa6GYRAhRak7cS5IG8SrSI/d63
         +bS+UhSeYi90UXooFJo5bKxwwq5MFZ4BqUGpf4UJkqrouU9h5oQQ02N4R55xDxH2Vi69
         VPRp/SmbyJCkQcCJAuz8OGEGEPePVrftx5yrE4QnTmJhq1ypz2BKjZs7IT6ek3SdwfUb
         oceA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782204947; x=1782809747;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aE9n3ah0N3qa2cRR38jYXiCfe+bTuewMNN2Ot/1RK5o=;
        b=NNEIXeTT059fTDBXtP0/drlKpA+WtkUV6doqyZ6jClQlLE4HmjEdp7Ef0k1xAzvgQF
         DNSf+l//7djhuXOEXFOBKGcmHtwiKqQfZyeqaE1KkygSGBCsLlOm5v72iktPqf6fvq7K
         a54gxrEWqUhoS8/2nlMnNbBGu+CEpRHGnte9VsYdskru43hGBdp6h1DT5pnS1+W1SNfv
         qkMJodjtHGX+ZSM9FHZvfxp+meaWddkGPBUcvITJFuZzMa/BY9lDKSmZtPehZ9lFkKjL
         nrgDE/6uu5EYhhbyPc/4W6lO/F4N/+jYZLiXaLqi9XSNGbwQNgFHOxygYRQNMPtv7et/
         4m3w==
X-Forwarded-Encrypted: i=1; AFNElJ/BIZSdvhbCd/AyaSsxSsHoP5zcQ8D9p1pUWeYc9Bhuzk4zlq4Cg1J4CR2wJpKkqCD7gEbKEmo=@lists.infradead.org
X-Gm-Message-State: AOJu0YxyndZNZKpUH2qmEQ4TvwtK6TXq0WHmGn1ps/1J6ZKXECM3mcY7
	ZYF1tPpcbEGHalronUw8hrpQbMSomdAOx9r8DdyjRi9vVRm9jQonPn9mZFjbkbJNBbfe3p+5Ttb
	73uDWJHwleNa7ClZwtlkvjO//KE20G9rctP2Qi2UHE0WJc02UKJIiIubvPSSHcBT3
X-Gm-Gg: AfdE7cnNE84c8zKSrUprUAmbXgM0Lb15MwAywBovDSOkul8m1SS4p89Gy6xn2wpNpLR
	VkhDB9Sz9p7JaUy6Ba8zCku1oSMTPfRq2bYXWY3umQnyIKIJBXq7zJZTKXgJZD4291arGDbqvZn
	2pboQlZdL6W1TfFjGNiZB+51c+9Sh91JRIiFUhEYFk/Kpxmk0of8JbVKXrdi3gkmbfUf4/WDzNQ
	QQLnifq3M1/Jxgj7PEPDAwvz1XXpXhF+1QnCrOnjUaAz3oV2bcjV0FcPZld/e+MKv09w+2ep+MI
	HnuAFB4PVBuZ3Kqwk+5JjC+OKZgkAA1solZzwtJnC6vMV5wg7AdqH2poOyYeGfZod/URxYbhBJX
	q4uyb6EIXnYvrnDNqMXl/GBp0y/Es6NoGKQ/qcTwJVxgG7jEdNFb0W34LsYV6TFvNOwDiChgh6Y
	E3ev8D0WSf
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581549637.33.1782204946636;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:4cc1:b0:3a2:bd1d:d684 with SMTP id adf61e73a8af0-3bb3404fba2mr20581523637.33.1782204946165;
        Tue, 23 Jun 2026 01:55:46 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3212sm10209394b3a.55.2026.06.23.01.55.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 01:55:45 -0700 (PDT)
Message-ID: <5abb5812-cdd8-47d4-b5a0-33f7351589ea@oss.qualcomm.com>
Date: Tue, 23 Jun 2026 16:55:41 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] PCI: Add device-specific reset for Qualcomm devices
To: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>, mani@kernel.org
Cc: alex@shazbot.org, ath11k@lists.infradead.org, ath12k@lists.infradead.org,
        bhelgaas@google.com, jjohnson@kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-wireless@vger.kernel.org,
        mhi@lists.linux.dev
References: <n3maiuu5cctivlal4fozysz37ir6ecdfws5u2xxw2neclsfdfj@nsvwvlh7b4j5>
 <20260618063309.9536-1-jtornosm@redhat.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260618063309.9536-1-jtornosm@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dOWWXuZb c=1 sm=1 tr=0 ts=6a3a4a13 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=_kWzU8USZtXapjXelIsA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX6jkayUNHa2Wq
 8msTyXdF2tQyqrxH6keOzSDt5mIDGXLH627BSNNDHHIZ8Z8Ewdwk/TJKzA7dmSrGJLDaKx4nnHf
 upfOKviwZfUTn4wtFf9U0uyPk13GdEY=
X-Proofpoint-ORIG-GUID: Q-kzzubQA-q7jNDQXdmfCdJ6J3-2rs5d
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIzMDA3MSBTYWx0ZWRfX42VXEdAbq7LV
 BypMoVjrWC4bPRFiDEZBm3l87IPwDLh9e1AgmMHGlAtiNet/PCVywI2BRcBt59T/oo17jhnpQt5
 EfdrTCi3GUd6TFjuf2PpPz8HIrmJFolnKzm89KVAed3JM4UrXPHucCBDZHmKZMAQiuNYlqSmcge
 +8+W3inKS9eHkjf80HFgMzGj/u1CQG0ki/RA6Gm3TwXJfYGcChAVITnbo2gowmHBdwgM75iJz4j
 J1tIiuAtxt3s/cr5MCkCY0/7OFydof4PEc83JcqIltPNkkD+8waQiqNv8b9bsVaRkVzJBKLtQEM
 oAM61k2c0IbmQ3AJvnJ7TnsBwxs7LnU6YY86YbRkFPqsqCUNvyy81MC438Hwrtd0VzUZBQTpKmh
 N/sxM3yDFkeiRv3wYf/k4mky57DK9six7OAWF+KquRJWB+DFZWJv3O6PSHBFS9dZPKesA4TnfBD
 vNmD9qoEbXj047rMLzw==
X-Proofpoint-GUID: Q-kzzubQA-q7jNDQXdmfCdJ6J3-2rs5d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-23_02,2026-06-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606230071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_015549_517729_99134C44 
X-CRM114-Status: GOOD (  22.56  )
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



On 6/18/2026 2:33 PM, Jose Ignacio Tornos Martinez wrote:
> Hi Mani,
> 
> Let me clarify the exact scenario and where the reset is necessary:
> 
> * For the commented WiFi devices (WCN6855/WCN7850):
> 
> Standard VFIO passthrough flow (this works fine):
>   1. Unbind native driver (ath11k/ath12k/MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver → device works perfectly
>   5. VM shuts down cleanly → device can be reassigned → works fine
> 
> The problem occurs with unclean VM termination:
>   1. VM crashes or is force-terminated
>   2. VFIO tries to reset the device before reassignment
>   3. Without a working PCI reset method, reset fails
>   4. Device stuck in undefined state → cannot be reassigned to another VM
>   
>      Unbinding the driver again doesn't help because the device hardware
>      itself is in a bad state. From hypervisor:
>      $ lspci -vvv -s 0000:03:00.0
>         03:00.0 Network controller: Qualcomm Technologies, Inc (rev ff) (prog-if ff)
>             !!! Unknown header type 7f
>      And a full host power-cycle is necessary to recover.
>      

what is the difference between a clean VM shutdown and an unclean termination?
specifically, will pci driver's .shutdown callback be triggered during the clean VM
shutdown, and not be triggered during a unclean termination?

> * For the commented modem devices (SDX62/SDX65): 
> 
> Even worse because it fails during the first VM boot without proper reset
> capability, standard VFIO passthrough flow:
>   1. Unbind native driver (MHI)
>   2. Bind vfio-pci driver
>   3. Assign device to VM
>   4. VM boots, loads its own driver and crashes:
>      [   24.024165] mhi mhi0: Device failed to enter MHI Ready
>      [   24.024168] mhi mhi0: MHI did not enter READY state
>      
>      Unbind/rebind attempts fail:
>      [  352.643601] mhi mhi0: Requested to power ON
>      [  352.643611] mhi mhi0: Power on setup success
>      [  373.442954] mhi mhi0: Device failed to clear MHI Reset
>      [  373.442970] mhi mhi0: MHI did not enter READY state
>      And requires a full host power cycle to recover,
>      even outside of VFIO scenarios.
> 
> * MHI Host driver's remove callback may handle clean software state
> teardown, but it doesn't provide a PCI reset capability that VFIO can
> invoke. VFIO needs a reset method registered in the PCI reset hierarchy
> (device_specific, pm, flr, bus, etc.). VFIO invokes this reset both during
> initial device binding (before the VM starts) and when reassigning the
> device between VMs - without a working reset method, the device cannot
> reach a clean state for initialization.
> 
> 
> 
> I hope this clarifies the scenario better. Please let me know if I can
> provide more information or run any specific tests to help investigate this
> further.
> 
> Thanks
> 
> Best regards
> José Ignacio
> 
> 


