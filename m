Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C3C0CA9ED5
	for <ath12k@archiver.kernel.org>; Mon, 12 Oct 2026 04:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ci/sk9jVWBmKRQqWTGWVz3nSdbbv/knUpwFr8a0Gvg0=; b=45eCtR2U7OFTaUkKNzhApd9GHX
	JVqHRFceVqmCmcIzPY5sGYnbVYAIfsAPcM81kwpPQkfgBqBwDqkVNatncpP4HW/qAuFUxQwVk/Sxg
	XolmKoaS8pK8ScB/a0dMV93u8CkADRguZsLQh8dzbVbhwdjWA39d4cJVSc0gO4Ir+kTqvhKiL7LP6
	5kt84TOzkZcXHU4oN0WQkugTTaJNBWMIGUvvlejAgwbNv0OjoMHp4ghUiaeW/D3peoGRsfrmfIQ/S
	HRU0BLLgipIjIVfYOPU2xcaGAxYns+keuIjE0kE9Cr/QN38x65hMmn0edVTeS7D09z7+bnIR9A0wV
	RFBWAxrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7sj-00000009efX-2x1K;
	Mon, 12 Oct 2026 04:43:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xG7sg-00000009efC-438h
	for ath12k@lists.infradead.org;
	Mon, 12 Oct 2026 04:43:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C1lNoZ328393
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:43:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ci/sk9jVWBmKRQqWTGWVz3nSdbbv/knUpwFr8a0Gvg0=; b=mOpyNx32vfFBwMsz
	98mhK4KJdB5N5WuM5YGZwAXuF8dYYvtP/pCuzQsubPYrsHoLG/J+71yvRk4h/lXy
	W/ySjB7vLl5RJq2+C+cM8TGub4LZGySCfeEmNLVFzMNj9/0kz00hJpE5I6jAfceD
	McMItJ1ieHM7HivP5jHkQfkZ9CifuOgnwRhmQ5KGzVqLE/fEL5KYOl6LcNvcFOu5
	V4n/SmXIB5CTlasODLdonb+fYqsaFZba5v1qMNqFQT0esSrsKJnLlp9D65Cpo/kL
	TBUx5Gi1WjAAk+i4SsM8WyNVcObnCr6/Dl2thBZ9RyeBvsKDLhVkLAlPy0KPPRWD
	Tjjpyg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7e4eck87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 12 Oct 2026 04:43:21 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-35a4d2e39acso2607000eec.1
        for <ath12k@lists.infradead.org>; Sun, 11 Oct 2026 21:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791780201; x=1792385001; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ci/sk9jVWBmKRQqWTGWVz3nSdbbv/knUpwFr8a0Gvg0=;
        b=AuobgJl1PIoFdD5xbRmnMKNkwohUiohawLwO3xBU8pAAlnnHGAWO2aLmKEqoJ2ejIS
         TSAELFmYL8wE46xvvTplGR3/yMveJhJsCJcz5Qc6CIix8Vz/yM/tUf4CvCjPmz5uCE7B
         /lnLPaaIAlOKjVMrQ2qse92l+VC/CCANAZn++wdtYBEmPZZ5hba5cyxCJTNBZ9LU638X
         9dWfORX3dvV29X7m/hM4+xyzPrSs5j1cvx+Q2t12AfVnaf5OQGCiZJRfNNdlYJvXYSlI
         s5cc1EADtZqzfbv/SzMNsA8B1Im8CBUJv1yQs7z4GkjBSNPJrbVPr2gaXGCobNGG6KDR
         d/MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791780201; x=1792385001;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ci/sk9jVWBmKRQqWTGWVz3nSdbbv/knUpwFr8a0Gvg0=;
        b=2WS/MOl6J80O1CebuJdgN62pA5d673lPEDYtHd8G1z1tsqe/EBom5mQ3QwvQ95CEbU
         h9Y91KNjEaxgSKyn4mGJ3pbzDMzXe7j39FLzZzestbZyKTqVyVzT4MIZ9hSQRIb8CjaB
         L/IhGKNiiwZ+LfMVOPLAHz1549sAarxS4eurKyNoJNkvNA438aq6w1U3D8uh8e8HlrUd
         GFwT+ugL/udQwCLdOnZjqDHSRfiFsbukYAZJ4MQY6PEGgoXgBd05h0v8TFQUuKoPs62Y
         XkFUCtshOiY93Zcq61ScpOF8uTmLOaWNbyzdc9+Lo+W5Dl/1jFilFh9v5nx5SO6y64wh
         62lQ==
X-Forwarded-Encrypted: i=1; AKwUvBzitv7AMY5mGsOn+0ASSiRSYRr9f1WYWoJWZ20ikCrWU4jTGhWCeDUo7vtIkq+q/IYxd8B3jrg=@lists.infradead.org
X-Gm-Message-State: AFq9FYKbAYPDA/WvAeLiEEmTJTlN5XDGdOiYAVvMCY0Csg2kTuznPeBW
	4MauX0lpv5iGQogd+FI3WF0tTEiZ4bhw0/pztHpfdVDtZZ5yOCw2UXxR2ahit9Ozk8D4xSN7H52
	AhkSMEBBC2JInnw1briDdZKvflgRc8G0NvaWEX7zQMTwPMOKI6Sgzf7Q2fszWGMGp+vGAGf1a
X-Gm-Gg: AYBFou39JswqSDli3u1k1y4OYTfhNUcwYh4eZQpsP1WMtKPgn39hWAXCnwMrPVrCovX
	e0LJlPQAyXzEkiEt4XYPor5e4zzhsEPnGhVaw7dBPTaJBNcuimCAPZqjKkFT/Q9SJIqTwyah53W
	vi9CtpFsiMZo8QeKFTPFS9LWZ0S8s+51HsXhBbF3QtctXcRIVMrTNOiMW1tG/RTzcmvaSq2BMXj
	A5pIbQ/dkwuB4VxCLh1F6GoIduvVyjHwHlxffsxnwoMGSJ+xrDEZ6w9Bm+E7w7iLAIAyGfpBwMX
	5CrioLhE+zTk6owbdc2+bAtkJPkmxkYTbItmQQBSSNvVCGEm9s+JcV8y5z20rYOKti+77vnv3LQ
	jBVVyCuoHQnr/SUN/CMztLPqBT4cucz8y1QzEV3qT
X-Received: by 2002:a05:7301:188a:b0:358:7bea:88d5 with SMTP id 5a478bee46e88-3587bea9608mr8878042eec.21.1791780200745;
        Sun, 11 Oct 2026 21:43:20 -0700 (PDT)
X-Received: by 2002:a05:7301:188a:b0:358:7bea:88d5 with SMTP id 5a478bee46e88-3587bea9608mr8878013eec.21.1791780200204;
        Sun, 11 Oct 2026 21:43:20 -0700 (PDT)
Received: from [10.152.199.23] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3537c61eaa0sm32450382eec.0.2026.10.11.21.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 21:43:19 -0700 (PDT)
Message-ID: <19429424-caf9-4d62-a8b1-8faf7b93b0e3@oss.qualcomm.com>
Date: Mon, 12 Oct 2026 10:13:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 ath-next] wifi: ath12k: Add EHT capabilities to scan
 probe frame
To: Gaole Zhang <gaole.zhang@oss.qualcomm.com>, ath12k@lists.infradead.org,
        linux-wireless@vger.kernel.org, jeff.johnson@oss.qualcomm.com,
        baochen.qiang@oss.qualcomm.com
Cc: gaolez@qti.qualcomm.com, miaoqing.pan@oss.qualcomm.com,
        hangtian.zhu@oss.qualcomm.com
References: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAxOCBTYWx0ZWRfX8ADat64MiMU7
 lXZ9Lw+kCsHTMnIqclACeyocxR9hKnrN7gA4TBJd5UCYEfsaxNhagcflBKhXOmNRyzUeRMfGkRE
 zk1shNOuTurWupsAzrwnMwhS4pBlLPg0Rr65RaVrR9kNHn0aTKmWcWoHdgFyxDZA/CAbJZa4Dd5
 OEHlCceWr7rLTXKMG6MhoFWXWr8MuUc6VjuLaPHvz7pHAVBlJ7xOTmOMpE8gLrZbpTweoTF9t6I
 LIueGEHwTho2JUxKioPqhaS8fdrE2UnOGbnUDghyxVx48O6bRh3hQiBGvpLTZMlnLSGGtqzqa7V
 tMRCwRsvCR5xm2RuWIDn6nWd7dcj+FS8PamzTvZyad7Fp2l9Sy/MisJlDKmCKq9C+yMEMwPfS2F
 ZpOWZBGQwyb3AGNJTmcP5+n58gLgjCzRykKl1sdhS/0nbpWIjGW4u5Ozi3u3x/zUah8IkIlPT08
 h47DCTJlUOlMSLPW0dg==
X-Proofpoint-ORIG-GUID: Ym4F595Ms1n0i5TcsT7d-VmCyd-UnHPy
X-Proofpoint-GUID: Ym4F595Ms1n0i5TcsT7d-VmCyd-UnHPy
X-Authority-Analysis: v=2.4 cv=W5utxhWk c=1 sm=1 tr=0 ts=6acc6569 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=QV8Wo-qd4fzodxduY_UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAxOCBTYWx0ZWRfX/fWBSz9x3ned
 2gUUZ5B03eOqhYeHE3ADibHwgNifnxi8Xp3lzBmpK4BTPeEEJ36IVexolQohy8ipyD+7QUiglct
 RhanZPcdPzXzTQYHeX/kDJamMX+mDWI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 malwarescore=0 impostorscore=0
 bulkscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120018
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_214323_027786_C4D6EB03 
X-CRM114-Status: GOOD (  13.83  )
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

On 10/9/2026 3:25 PM, Gaole Zhang wrote:
> ath12k hardware scan Probe Request frames do not include the EHT
> Capabilities element. Without this element, an AP cannot identify the
> STA as EHT-capable during active scanning and may omit EHT-related
> information from its Probe Response. This can result in incomplete scan
> information and prevent userspace from correctly determining the AP's
> EHT capabilities.
> 
> For firmware to include the EHT Capabilities element in scan Probe
> Request frames, two conditions are required:
> 
>    - The scan channel must have WMI_CHAN_INFO_ALLOW_EHT set, which allows
>      firmware to add the EHT Capabilities element to Probe Request frames.
>    - The EHT Capabilities element must be configured on the vdev through
>      WMI_VDEV_SET_IE_CMDID, so firmware can use it when building Probe
>      Request frames.
> 
> Set WMI_CHAN_INFO_ALLOW_EHT for channels when 11be is supported by
> firmware and not disabled by ACPI. Also configure the EHT Capabilities
> element before each hardware scan when the element is present in the
> mac80211 scan IE buffer.
> 
> Firmware retains the configured element in the vdev context until it is
> replaced or the vdev is deleted. However, ath12k scans may either reuse
> an already started vdev or create a temporary scan vdev that is cleaned
> up after scan completion. Sending WMI_VDEV_SET_IE_CMDID for each scan
> request ensures correct behavior in both cases.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

