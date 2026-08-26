Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B150C61DBD
	for <ath12k@archiver.kernel.org>; Wed, 26 Aug 2026 17:22:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GUp9mWn697LHqoXe/t2BQOvcPOdG0aKShFCgaFRzBNE=; b=v8bfWhwMZ6SZ+EwKX+/5031fpp
	pK/bgjLkqUOfnKrAl5LC3OnRkinE/J4lHqgoPbQsw3XNn1dxUhgBkAyhbciy58Eukaf/ZpZP1Rh17
	aueXICdfg8lfZOzLcB0tzIrhbM5FVf09sOGWxFxy06tDd6DgE7VgI6jefEcL+X3x4zzhV6JdwDh8b
	e2/Op+Q9UPvO0pVxf0lgoHi3/0gEACKX/7/MWEm3RAiVWw9WOGN4yR3ELI4hCM9EWmRaCGRY8ynqT
	LXol5rcmxVOZmDCbNLruuEFLf96FoBahh2t+28F7TtA54J/W6a5WvHnOGjzm/OYDFqyoCJHiFnzNR
	P8ShuuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHKT-00000002oH6-3jIS;
	Wed, 26 Aug 2026 17:22:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzHKR-00000002oGY-1FqJ
	for ath12k@lists.infradead.org;
	Wed, 26 Aug 2026 17:22:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67QGupFS424874
	for <ath12k@lists.infradead.org>; Wed, 26 Aug 2026 17:22:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GUp9mWn697LHqoXe/t2BQOvcPOdG0aKShFCgaFRzBNE=; b=BvQPBtD5AbfTg03f
	5PI00B+B7HHveVeq/q+j5RbhlvfO5hE2pGgmhRN5gwgWxSWkgYIJ2ZIktW3lb+WD
	Sf+nYlbgjGa7AUYZFoOXLNDoKF8R2FV2scb91dMyfia6lFjw9h0IVuw+aa2eNLoN
	dujrupwdl1ZVtf2hhENkxHG+bFlNNNs6zICA1rBJ6Oi9FPT6b49IlhrXCqOxaqEM
	YntF8Mb1R3N/FSmIrWaU/tYVWhp/v9N77mldNHQcKB95AC2MfiO9tKnCkuFskY45
	kRBLBZcxFhxYsV4si64ksobgPELNEUPeZHgGa0P1KnRJEG9QeHiMUX1DZsbKDp0i
	uvBa1Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g9wmqsuu5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 26 Aug 2026 17:22:21 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ce7dff6253so983625ad.1
        for <ath12k@lists.infradead.org>; Wed, 26 Aug 2026 10:22:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787764940; x=1788369740; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GUp9mWn697LHqoXe/t2BQOvcPOdG0aKShFCgaFRzBNE=;
        b=J789zcm4Rl5ZS0aejWNlbbCUcU1+t4WCE8ed13hpYwOAMT74vN6hY2HehkL3qir6u2
         dTr/X9hjvUijf5ZkeFZsAGxe5ApEOhrFcAko9egT8TI/1yPfHKjOR93lnj98wAsCmbc+
         KbXJfiAjAgtHUPhxccsUvuhMkDXgFRS5psU70l08ec53r/RWXGr3uBY9P3IEJQa4FOqM
         eRV450UEimilqMXWKzg95vdYYEmMWnaQ9NikObfI4pCSgltKhXpNtHYokwEB3EGdwDJE
         aW9ws/q5X/JmDeoNAW2cLpZvbXtkFaj4AXJhmxp3nHoN2Q4IDAUYlzgWHlqlGBQYDLTf
         El3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787764940; x=1788369740;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GUp9mWn697LHqoXe/t2BQOvcPOdG0aKShFCgaFRzBNE=;
        b=J9xGaEzFVWPCmOnCms+UtK+4LteT6/qIS7cf7YRbmA1ELTUZSmHIt2S2CQGbPMcYiw
         bYCVl2OqSrpDnSb+QikuVxJgzTP86IvRmrEaQ0s8r3tMKUVJevnZPr/ri7YGouZ/KCws
         KRV7SPdPwG6/X0TDkNG3Y9hImPY0UH+tpySM1anPwcYxQTA2RIZ5GD5SW3AM5nojzGO4
         aXsE8gw/odRzu0GTc6/s/N4d52nbl5Krj+xC1qYsyYDm6M2BYh368U9XVWPOlWjOmS7T
         zCUTocxRZKtRWuHG8Fzc0yQahwmjIUu79/0yhMDgCEKRD6xAjeiY/vm2mK5vICp0ulG/
         u6Yw==
X-Forwarded-Encrypted: i=1; AHgh+Roo01tWJpmDLTBMXvUvEttcYoSAxIfcI/gDCY6mWXHUC/SIXFAVypmgUDZDo2XKXr6gGV9byyo=@lists.infradead.org
X-Gm-Message-State: AFuF++nBjH3d9EEqMR5lN92kSYBso5Sby+e+Os/AJe2RO9A+vzzwJmPO
	CVRpUiGP2+h6CzH1N0MAyIdsyj2eFpkGKV2OCYd26/5NvUeE2+BAD3bP16QV771PNZQiAKHXYFU
	vYHU3+5PNIigdP/otRylnxF1n6NQVpE/ZAg3X852l6DZ+4XhEdF8rxprk2RNtUihqK9BVV81y
X-Gm-Gg: AR+sD10ddVQ21shbKz/4DbRewdZdCrAptDYGqFE9vsbxfrIRBZ23o5ea2huN/fmjD0N
	nxLxNpxFvHlopx+uoaghUZ0lkCGoQrHagWr4QY/L6KR584QngmXr02Gc7/eFWhvs2X9YdmfrbGK
	7q2NJTYpui+3d7Cn9Fm1rxGkKPdkwl1+dgWZF+c0Cd6+bjm/g/8w8XsIc9ABSQ2DqHYR/gr8rFC
	/uwPhRmDQly8UjfzYbKW0JsC8mHREhxrTmWtj0LzxoHfMW+SsjVX4sZ6y4lT+LbWFWamHnwGOy9
	/LipnkPv8uc4KvDane4a2nqtI3TfY5yOCVLloX4fC4++CuWpl/hWLj6REkFzinUqGYujQPND6EB
	AgydPgdfM0qFfxBKPMAWtmos2I8BwE53brjsJFnqp6F6T
X-Received: by 2002:a17:903:40ce:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d7269f5c6cmr7474985ad.13.1787764939925;
        Wed, 26 Aug 2026 10:22:19 -0700 (PDT)
X-Received: by 2002:a17:903:40ce:b0:2d2:72b6:556b with SMTP id d9443c01a7336-2d7269f5c6cmr7474185ad.13.1787764939373;
        Wed, 26 Aug 2026 10:22:19 -0700 (PDT)
Received: from [192.168.11.105] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32854db74eesm734542eec.18.2026.08.26.10.22.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 26 Aug 2026 10:22:18 -0700 (PDT)
Message-ID: <002d8ad3-fd9f-4918-8a01-6000821ecfcf@oss.qualcomm.com>
Date: Wed, 26 Aug 2026 22:52:14 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: use kernel types instead of
 userspace stdint types
To: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260819-ath12k-cleanup-userspace-types-v1-1-161a1e8910f5@oss.qualcomm.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260819-ath12k-cleanup-userspace-types-v1-1-161a1e8910f5@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI2MDE0NSBTYWx0ZWRfXzaxVDuotWMrn
 dmjTGNWEHwONM9yugh6Lm7JqhJKNAWVcMydKMS8d4F9nCKbTpByU5R+06GjicqX6DNloLdxtOMS
 9DtbIb9zQs6DrhhtG7q96vh/Ab+QSXs=
X-Proofpoint-ORIG-GUID: XJYZE4i_4Qn8a_fCP3wSDZG3veSZGvh1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI2MDE0NSBTYWx0ZWRfX6ELOO1rR40EK
 wDt8qO83bkzjNF9kxVfX5s7Ir2oHn5sxUzhyZa8GDJRIB4DArf5XBeeHescyqsdeuBfnF/zGzZb
 kjzRtUb4NW0jtf2O0Zeu1zhJajKClkVp9h1kcbxCrMSG1usHXINBgTHx7OSFrF2HONarWVR5gDN
 Rm6nGaA0cBsj0+Jc2LUmjqNcFaISv50BcC0fkLYoD6eMCCWIdSkg+gls/91EOT4O93SrtAA1sii
 IEEL+pxBQW4M0Y8+JzLCz+vwVaiUudoIPq2SkQ5ON3jYVlVgizrOW4fS3ahoR2eYpf9jUeKtkSV
 rXZdwUH8LFg3F7cx58KSLLlgJiB6Bh4aTKPPWb13BMk2WInR/RQnZVCJcRWiOCGG+htqrI9zBqj
 7o0Oq5OKoK76UtqxYxVGwjO6KlcWcpojq3Pgl9BlLjfj4qeSs9G1Q6K9eKgAD+pt665gnJl3qX+
 8kTTZUIEaREd4MPaccA==
X-Authority-Analysis: v=2.4 cv=T9S8ifKQ c=1 sm=1 tr=0 ts=6a8f20cd cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=S76r9hedyb03ojg00oMA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: XJYZE4i_4Qn8a_fCP3wSDZG3veSZGvh1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-26_05,2026-08-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608260145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_102223_353601_B5E7DCCD 
X-CRM114-Status: UNSURE (   8.09  )
X-CRM114-Notice: Please train this message.
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

On 8/19/2026 7:13 AM, Baochen Qiang wrote:
> Replace the userspace stdint types uint64_t/uint8_t with the kernel
> types u64/u8 to conform to the surrounding ath12k code, which uses the
> kernel types everywhere else.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

