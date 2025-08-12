Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7CC7CA0ED1
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 03:25:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI6+rjoYfNrq5GHmpQ+I3O14nPmGvTFm0ilMoAhx5Pk=; b=TWodBco2D4D5SV3kBReoGRh/0k
	21uVUzPpzx7sUw+yJ1sJvrRQTrzjiS0XACdvmccOWhBk2K5umdhI0vp/2BVDf3xBmoEDIiiTQ7sEV
	yokQT0NGGVbqiP9YN7I58bTWxMtS1Wa/NFZ/w1zerzmEt8HpqxYY2WV9+39G2dM1Yl/Y+YqnxfDq/
	XhnvryhWcaFBG582ZS8gw95kYjlo3Jaz1tv/FyybXmB5puWqVczgMP3jtxupI4qC6AkeghmhOSSSW
	3g+Ayp3EMIpZZmWPYL4cWMFhLGlescfJL/F7sVLAqORoXaSWWKH1UAvvKbeGKCjvoy5nE2kVhRG6T
	uJjMhIlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfdi-00000009iFu-2L5l;
	Tue, 12 Aug 2025 03:25:30 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulfZW-00000009hnY-0PnX
	for ath12k@lists.infradead.org;
	Tue, 12 Aug 2025 03:21:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57BFVDmf019150
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 03:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bI6+rjoYfNrq5GHmpQ+I3O14nPmGvTFm0ilMoAhx5Pk=; b=fZUYY4ErmUqvfrt4
	GxekSgvhEu7SuE7LQ4MQ7rrR8cNVShtcLBnKhgSRPDXcIaIFu6p4Sy4P0WsGLshG
	semjjE8kbhkFzAdVKzam2mmhUmZ+8kOViEDnGI0B9LsR9rTLLHEwbawWNx6QSQY2
	ulNwARTAnAdXr33vqA+caNooPoVtyHbiqIbLO7YS2obM489BSigdR1AiVf+oshQy
	64A5P+kLq7nJUQ4XulQuV0e8+PiXB9/C9fmMhgySyb1hs7+iuwtdD5pJAVCfxFHh
	XTnWYIEjkXdkpxQ9csrfrqGNCdf0Q/XxRgpDk5r2BCk+QLcQHQ9elKh0ZFpNdMtD
	b8Uijw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dxduxkjp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 12 Aug 2025 03:21:08 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31eb41391f3so4944632a91.0
        for <ath12k@lists.infradead.org>; Mon, 11 Aug 2025 20:21:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754968867; x=1755573667;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bI6+rjoYfNrq5GHmpQ+I3O14nPmGvTFm0ilMoAhx5Pk=;
        b=u7aZPxAVh7H53Cg3nlzvfRQItrCKyTT4Em1gW7uz/LFb9qw7NRZHbAEL34dLFpY98a
         QmXhkTaqunC47vvl8DZVtpkIhJ4BSVMVflvc/quSHSY3oPRy+Nk2LxC2XT88f7eksanN
         LoDnqa4eaObo7Nan9Z1PFwE+9vse2FbPwFJvDUR/7oUF146EwFZkI7gipTne5A3Y4q3S
         P18HBULw/5Co1oofByk8LwzMXBQjvijEhu2TcT6M+H9s8O0VQZ33n/TlJCq0Gs1kZDnt
         hIZ18YixaiXQtq8lfNI+X8/lY3DvOrDUeeGq25HWYDoaSEwMQusNRfQ/ZQHY2LdppQqL
         mRQQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUQArDiV20LxF4kYrDPRgyt7kf+XElfAoAN5b9GOdvZ41mobOU+4GmgP++e2EP7seLa6860Dw=@lists.infradead.org
X-Gm-Message-State: AOJu0YwMo5SPFYCaBULL2pr12i0Qg2Svu9B+M0j1/GraGl1MWRVQMCRK
	8oX4sHMmKpEZrWjRNhKhgtixwBUV9M85IaPLt350C3QiKuqGBF9VcjRinBmVY+1wjM1qfFkpdEZ
	DWBLF0D9Bd9ILMKCO41hXuRT0kdT0YKyBcshSQ4cWrS83KCTNm+TGlzxSnt3XwbMou4Zp4z1M
X-Gm-Gg: ASbGncuR6RFWCRK13gWxhR7XtHgIfn5xszO0k0E2PAWDl2zidSkj3MhNPqx2JigK4LB
	oBbhCasdsTNHWmTZuh5x+l0AQpfxF7eO6L0woh1vdMrtAiutE9M+RS7SjjEjoX60p53t7LfK8Qe
	HTZZX3lhYENdK5NBJVMb/bCMrjxaauB6QaIj2GZmJP+bklJaa1GqrYZcftgUNME1C6t0JcqYFwS
	CzEXDSvTMjHUuvLoy3Cb9kvMGiS+t9uab/xlnxW7YTZqELtl2U4f+iGtVhehGDR9QIGgqynxskH
	5cnvuI8zmNLm4/C8tXvJknF7Z+PwYNhbukIlEPDOiLGNV6SZmPhsV1Sm19HWcZMn1OjhpAWxOkz
	H8JIqB2KsPul9OPLDj7Wjda9MhrYQs6o=
X-Received: by 2002:a17:90b:1d44:b0:31a:ab75:6e45 with SMTP id 98e67ed59e1d1-321c0af20famr2624319a91.28.1754968867336;
        Mon, 11 Aug 2025 20:21:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHcqJPM2xuPmjdSg5tE6ZuVrib457UevHZIAEPWaMOYhmzS3EWSaoKtkI3A3vwo4wOhUxIimQ==
X-Received: by 2002:a17:90b:1d44:b0:31a:ab75:6e45 with SMTP id 98e67ed59e1d1-321c0af20famr2624288a91.28.1754968866862;
        Mon, 11 Aug 2025 20:21:06 -0700 (PDT)
Received: from [10.133.33.19] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63dc1880sm32784064a91.13.2025.08.11.20.21.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 20:21:06 -0700 (PDT)
Message-ID: <7d934313-6062-4165-b001-853b1a66e2bc@oss.qualcomm.com>
Date: Tue, 12 Aug 2025 11:21:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Enabling 6 GHz band in WCN785x
To: Petros Christopoulos <petros.christopoulos@gmail.com>,
        ath12k@lists.infradead.org
References: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <6492c438-7cff-400a-80f2-cf17e298569f@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=IuYecK/g c=1 sm=1 tr=0 ts=689ab325 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8
 a=YEzdOYdMHGqEZcbkDpgA:9 a=lqcHg5cX4UMA:10 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=z2U-W3hJrleVIN9YIjzO:22 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: ju6pGPfdnmpLK2NjXbsR-5MOMxzLQM-z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAyNSBTYWx0ZWRfX1z6YMNyLdhCl
 z/FZ2NXvhCEqIu5sMRRmnqdTtBNlJWkBgf91jw4G9AV4mWVaMp2VF4OLMPyZ1IXBfoqmei4Khfp
 f7HLSGbo7cGYbh+dxWxNYKGXvi2BoyLccDFe4tmrWWQEZVwNFNeu8MSlej7vuDMTRwXewM0kihS
 7zpU+5MPfWkHkyp7Ue1GLN8hCS6FDliR3uhrq6QYS1/BrlxRWhfUzAffTmNkZH3Wap/p2Dnd/5E
 pQvTSWXS8oMG8ffvwE5Sz/rI0LOtEl6rnjsEA6S4+AuXEyinRFpnMXvMDDN6i5IazTUyXfDxiXG
 Ia/cTNuwbdhKYbyxSszBPpM/PL6mwojvp6oWPJhSVZhe/1U/jt/rNuH/VdbPUz+Kx7ovlL51Eob
 thAuBty0
X-Proofpoint-GUID: ju6pGPfdnmpLK2NjXbsR-5MOMxzLQM-z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-12_01,2025-08-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_202110_264754_5FBB3288 
X-CRM114-Status: GOOD (  17.12  )
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



On 8/10/2025 9:56 PM, Petros Christopoulos wrote:
> Dear all, I have a Qualcomm Technologies, Inc WCN785x Wi-Fi 7(802.11be) 320MHz 2x2
> [FastConnect 7800] [17cb:1107] (rev 01) Wifi controller
> with Fedora 42 KDE, latest kernel 6.15.9-201.fc42.x86_64 and recent firmware 0x1108811c
> fw_build_timestamp 2025-05-17 00:21 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SI
> LICONZ-3
> 
> The 6 GHz band is disabled, I suspect that the problem is the 00 region setting in phy#1,
> however as this is "self-managed" I have not managed to change this (iw reg set or an /
> etc/modprobe.d/ath12k.conf file with "options ath12k country=DE" have no effects).

Try with CONFIG_ATH_REG_DYNAMIC_USER_REG_HINTS enabled.

> 
> $ iw reg get
> global
> country DE: DFS-ETSI
> (2400 - 2483 @ 40), (N/A, 20), (N/A)
> (5150 - 5250 @ 80), (N/A, 23), (N/A), NO-OUTDOOR, AUTO-BW
> (5250 - 5350 @ 80), (N/A, 20), (0 ms), NO-OUTDOOR, DFS, AUTO-BW
> (5470 - 5725 @ 160), (N/A, 26), (0 ms), DFS
> (5725 - 5875 @ 80), (N/A, 13), (N/A)
> (5945 - 6425 @ 320), (N/A, 23), (N/A), NO-OUTDOOR
> (57000 - 66000 @ 2160), (N/A, 40), (N/A)
> 
> phy#1 (self-managed)
> country 00: DFS-UNSET
> (2402 - 2472 @ 40), (N/A, 20), (N/A)
> (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> 
> I have searched extensively the web, found some relevant articles (e.g. https://
> patchwork.kernel.org/project/linux-wireless/patch/20250401020840.357-5-
> quic_kangyang@quicinc.com/, which should be integrated into 6.15.9 if I understand
> correctly), but still no solution.

Do you mean with the whole 11D support series merged the issue is still seen?

> 
> I would be grateful for some help.
> 
> Thank you very much.
> 
> 


