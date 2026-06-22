Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33ECECDB471
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 07:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FV8VvFG57wj4BlxGVgeaWnLGG6mPu4wqlRTGx9btkQY=; b=vgNLiq9FsHKM3TyddPT78W8aAr
	A0ZBW3LN+IrjLn1SQYpuiXhbfiB/6GuTWNfKGFbAgRPXEpN9zJ4q7zEzfSAvzcZj28BDfvtU49+EU
	z8jupRm9caS0IwmSqvfzbmVukVRqLRJ+CN74s224Ei+WO/Rp1IzJSi/vwvT4lmLelweW6QJ9N8kIn
	INCBoUjp5iX6PKejwXTZ2raN4nYysacA/pjR1b4onns+G7JKbzrrDzny9wVGe/aBdVTandGjM2Jvb
	J26OHFhna5OD4IiXJkyWuv88MWLGyL9MmsL7X9CgU/ze+X09vFspi2GfaZvIfl7WvEyOPbKL3Tq63
	UfwE2Baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZAs-00000004XzJ-2a4p;
	Mon, 22 Jun 2026 07:34:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbZAp-00000004Xyq-1Cdh
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 07:34:28 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M5B8C7156653
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 07:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FV8VvFG57wj4BlxGVgeaWnLGG6mPu4wqlRTGx9btkQY=; b=K3/p9302PUVLEB4Z
	jt4cW6ZPtL1dGiQtJ1txynS+uJW1UAPleikhNfUpkY6dFHvg2ZzTKkRlPnJ5oz3H
	DTb0Iyjg1TkTvXS4Z9o2B0zYpqNXBsauBA1bryYgv/74GwHVNQE3yJ8SXCDjBIar
	19bwesjw9g6GTXg0N6e8bTdnV5C2NM3eBt/EbT20DvrtEjxD3vebqhj0O3ADdTEX
	nzXSJziD+FUiyFrBUnA9jprKJVo3NkEo4nA4RA0bOSkN1fGveEKk4FgjFKu9S25n
	s9Mu9hLav81gXQiDOFI3rggTFqlLiehhSgxkk0jAhRKpNkSbPMPCELrkBkoMSzzq
	xYMGoQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewg7mnm24-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 07:34:25 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c6bbd0afffso77001395ad.0
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 00:34:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782113665; x=1782718465; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=FV8VvFG57wj4BlxGVgeaWnLGG6mPu4wqlRTGx9btkQY=;
        b=dSPlIqB6XAVMOUjHMCfIJ0E2xFY2pJfjMpuA0wOxlSfC/WqPXeP1uUroX0KP3ElsP5
         GrXkaTFgCrg1tla+XzikwAhJrn1bfYOrec1Ivf8MNbaqMuAoRxMlK9G01xw8H78xML1N
         SHB0yG6YQ7PTJ27neraFdEcX24ytzYjX5Ic6Aht8HZma7YPLO4CN71UifE0tMnQ81qZW
         R+dw9oS4owatxSCVU+XW0+Gd8YQ862fKRAOE9tUb7IMi2+9qKHuh8de+SJrZBmSc7hN5
         yAHOOaekmtR0izskzOklv3GGuivzC+RE9cxqAZ2QP3ZSD2do6hClSstrt+tFKm0crrOo
         An+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782113665; x=1782718465;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FV8VvFG57wj4BlxGVgeaWnLGG6mPu4wqlRTGx9btkQY=;
        b=U2+buPXKsQhwEO8dcKxSf399Ij2JdltKegm49MKHhzYMG7FX95H1frj+bN6fxl5O8N
         TAx5dUcXQEYqPw7sgMQ/egAXBmNUMiiCy9VWOtKtRsyGJpYyK9vCKHIk2I2iBN2BasCj
         hEdnCez16xc/r3lrcHR8mBOulHEULzyaw/ddCehylalCFun3K2n32owyx9bwgYSoRExv
         88fxIkrvsAy3O5s5HMfWxniXqlBBEX9mpWiyK3S7C/xPx3Rol+LPX2r+zmwggtPXoJKK
         SlByIrTtJv+prqChHF+UI8AeEtXa2N8I4bJ1cFMvCO4NsoxCDw2WK56pfwWyhOiDq1zI
         i8yw==
X-Forwarded-Encrypted: i=1; AHgh+RoguIvEsIciKE2QuaEtBEJGa9jQwaDhdOt/A1LdcqY9kSTSXv/CgW5VRbwqt0Ok8s2uIKsJ5LA=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Vm7f34Ujsfq2czg3517HwEe3hxG6cRnxijpoCYU1pMxVwYhz
	+GLdsgrETqhRw44Urby6z9nbe0GBV8fqVVZRvmmr0BW2Q194icers7p9/Xpjw2kPsuDi9W5uCNq
	UcHTSsIkEDRMtAT4O8g/oNgqHsqEOh4rgQ6Ho86JuPeFoEXh7ASAPlSZFkFUXD/y4
X-Gm-Gg: AfdE7cmCC7fuuOuW/PNlU1r7JIhRO65l37XyOknvGSlQdGvG4zX1QTRlnUo+yBoqqTx
	JOXtxSnrkiTQXYBxBDXb5DEao9BSVi+fEFt4c3DwFkxNyZmsopWMTl/p0AToXJmzFjIsJujULvK
	YOTUBfEfDXWkel3luBUwRYXyYTHiQ3G36aqWr6u6UT6OYSPIuhGkzCvelswPdvUgseXSI1lvxoG
	XRfiujV3IDhf+ZReGGDNlJsiBsK0FUnZzfH9MIWT3cFEAaQgWZOhJud/Sm0axRYgzDmN+zLvIc5
	dR9sPgDggBtXnkXceV7wiH5ug+V0tXfm/RNcE1XC6AcvGT4DAEREJRX2I1avgKS2ekuhIX5xk1V
	gWZXlgZ0P7/LFvRiP0ZZ6hG5707Fachy+RfAkljG4+VyLS1CwB21sJXcHIN+4DEUlqhpOkH7o/t
	FcK420zdys
X-Received: by 2002:a17:903:388e:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c7253af6bfmr127017875ad.0.1782113664768;
        Mon, 22 Jun 2026 00:34:24 -0700 (PDT)
X-Received: by 2002:a17:903:388e:b0:2bf:1fbd:b946 with SMTP id d9443c01a7336-2c7253af6bfmr127017505ad.0.1782113664198;
        Mon, 22 Jun 2026 00:34:24 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c7439f8e51sm75241645ad.39.2026.06.22.00.34.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 00:34:23 -0700 (PDT)
Message-ID: <2712d819-2555-4223-b92e-3148f2d17497@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 15:34:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: reset REOQ LUT addresses before
 firmware stop
To: Aishwarya R <aishwarya.r@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, P Praneesh <praneesh.p@oss.qualcomm.com>
References: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260619120751.363340-1-aishwarya.r@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA3MyBTYWx0ZWRfX7S+CDL3dSDYB
 vuNq5UVmT5drYCI3EFOkIYxpp4/QTOxF3hd5aMGAT5GDABroj1Yl9F/HvH7E2GISXBv63F/h8Pc
 heINfyVHmLal7aXQtZEdrW+7+k21/TvhrtCX+0K4tHQpGNoULe7c59fXs+c8UkSxqywI4B42CW6
 6tIgtkLXbY4p4Ln5OYHnF65IyOrXkrTUMG44OjOXhAcCAha0jkbw47HMSUhoXYQFzq7pCvbVIGg
 M59vDwMJkMTSZ3KRLg9W74SZvcsZKOWGOo9REkYeivwq4RQpbwYsm/09l8loI9FjvYz5UIZ5L/T
 m79DJXcxQuTvdtM6tW7r5OSW5GriSzDEQajz0OvSnigPIhpXBGdSLrSzw1Afsv0/rz3FI7MkoYE
 /99VO/suzpBu8YUgijEEu5YyB5d+fVsqTUlTPME07VcinqO/zlrnwqT+YXa1B33Z2m/c/1Xay1V
 AAubo6LjZKcVALTH0tw==
X-Authority-Analysis: v=2.4 cv=IOMyzAvG c=1 sm=1 tr=0 ts=6a38e581 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=rEWi-qFIhFxvFm4LqcsA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA3MyBTYWx0ZWRfX6mGssAPi3ksl
 zLJTk/CjWATLpTGt1nE9/dvCoYfYSgepA2R1PnfH4ll/cQRDrfFFHjsaqXCyNMO13zMWKmEtvrO
 NVi8/ZRER+JOim5dSKtxEHaWVzlcD+Q=
X-Proofpoint-ORIG-GUID: 3lHBGCEPLlfoUuCYBNUAysz3ijIqtUAO
X-Proofpoint-GUID: 3lHBGCEPLlfoUuCYBNUAysz3ijIqtUAO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 adultscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_003427_456101_18B7DD56 
X-CRM114-Status: GOOD (  15.63  )
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



On 6/19/2026 8:07 PM, Aishwarya R wrote:
> During module removal, REOQ LUT cleanup writes 0 to the REOQ/ML-REOQ
> LUT address registers. That cleanup runs from ath12k_core_stop(),
> after ath12k_qmi_firmware_stop() has already stopped the
> firmware (mode OFF), so the register writes can hit an invalid target
> access.
> 
> Move the REOQ LUT register reset before ath12k_qmi_firmware_stop(),
> so the registers are cleared before stopping the firmware,
> while register access is still valid.
> 
> Additionally, handle the error path where firmware-ready setup fails
> after LUT programming but before core_stop() is reached, ensuring the
> registers are properly reset in that case as well.
> 
> On the crash-recovery path, ath12k_core_reconfigure_on_crash() calls
> ath12k_core_qmi_firmware_ready(), which re-enters ath12k_dp_setup()
> and ath12k_dp_reoq_lut_setup(), so the LUT registers are reprogrammed
> before use and stale values do not persist across recovery.
> 
> There is a brief window between the crash and when the LUT registers
> are reprogrammed during recovery, during which the registers still hold
> the freed DMA memory addresses. This is safe because the device is
> non-functional in that window and will not initiate any DMA access
> until firmware is restarted and the registers are reprogrammed.
> 
> No functional issue has been observed so far due to this sequence.
> However, this change proactively avoids potential issues such as
> invalid register accesses after firmware stop during module
> removal and error handling.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> Signed-off-by: P Praneesh <praneesh.p@oss.qualcomm.com>
> Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


