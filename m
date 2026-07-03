Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 868FCC43458
	for <ath12k@archiver.kernel.org>; Fri,  3 Jul 2026 07:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ngijrW1o66RPMM4l7xoEqLhLY7J5j0WjVIKSD1HqKY0=; b=sdvD4axhELxeB0Vcfv9i2Cot+B
	fF+TcyZJSR/EeuLgPT5rfEzDTke2cjy1h9+DURM0RywsrX12d2lw4NEM2oVPCWvRhw28yHxaSJ9zd
	0tgMiBU0OGoBgCjk9sq2TqCyJj1SO706IUZ74k4lrvERCVjLholutLulnxyMfXoH0k3X+5uTSKhFQ
	+0eePD3RRqqV9IhK/y0k8ekb3eU0szuZ3fUT6xXe76bSYx+i6I8nodkSaZhw7KmTMyp7wZyNf1AqE
	8fpuHprJ+KNF4BoHuA4aig51kyaie59K5Gay4+ZVzecE7AKy7en5xxo76P1c9YRA7rlSluXjIJY+x
	YT+fY0Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYbZ-00000006IUJ-0r4H;
	Fri, 03 Jul 2026 07:46:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfYbW-00000006ITt-1f3k
	for ath12k@lists.infradead.org;
	Fri, 03 Jul 2026 07:46:31 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6635rZ213136108
	for <ath12k@lists.infradead.org>; Fri, 3 Jul 2026 07:46:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ngijrW1o66RPMM4l7xoEqLhLY7J5j0WjVIKSD1HqKY0=; b=OWmroleqjOQlzNVT
	hcm8Jmx2h34kH/oard7T8UMcrd7OuaLWw0fMqNI1Wp4zGEhoUlwvM6uQLNpn078i
	H8LD50c54FYuH3tQ0pq6IpRx+9H1sYCtgEVqXp0oZeQEz94wo8WMk4FkUX7Y0zMM
	7bXgB7wYTZ4Kh3AIqYXCXrKtVVmOgGuQ1YuA6m7i3yRZ+gFN3sizrVs8J2TbWD7X
	HtHyYmEvPAJ5c5afF88PifMiLEjznynhQx+UnM5W05xNbnayZNwdFpW+Ex6sz2A8
	EkTtbzyDR+JrG8xl7QJ7B5AApVABfJcInlsQWKpC8T5xoS3ODpygo6cQXmmH6jCW
	sweSiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f64b598qy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 07:46:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2c8284701c2so3641515ad.1
        for <ath12k@lists.infradead.org>; Fri, 03 Jul 2026 00:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783064789; x=1783669589; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ngijrW1o66RPMM4l7xoEqLhLY7J5j0WjVIKSD1HqKY0=;
        b=BWYtcY1vLKh0oTCQSk3PA8FYt9ReKaZPhHBvGA7b8hAUTwm7FUK9hysR8dEJJ1IhUq
         eK6Gz0fO520FJQUltyfW86+Ns02U1BP0EEHL+xjaKseUlx1ZTIaywmSCD/d35nj/NC7x
         KsRrsyucccM7pEtF/X2NhZA5wUXcImHXmP0WbtLszEfz+n3XAU9q71WlX+ww2PCXEz2I
         eTCRfQhhhgncy4UmR1VEZ8OCp1XLiE+WKKtwk7pT5LGLo7LO3RissHmlt0Uh306r2zBa
         HT/r1wcz2bC8VrTw6fCMgq0CDqCIelH3J06sKPCaNPTVG0/7tWkcA9l/4mPhjJbFh0VU
         j03g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783064789; x=1783669589;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ngijrW1o66RPMM4l7xoEqLhLY7J5j0WjVIKSD1HqKY0=;
        b=sgjGs3fI28CciQMq5Hi7KUk1YNSa3qlP5Nd6VE51rJY6TiwBn8x0tkAj4wEr8erwR0
         pckjToRjn0BKlLfhGz57g+pi/T5Q78hvWoSrVRrEnKGxOykbTnZ7UCB+F9zY2crUey7g
         68TpGgLqhgnmuYlm/MV6jkjsTHJJIdafjZgj56SP7I69DPw/1ivvhYKzbhjnx68Kmxec
         Hai/zv6tda7TLkEiWY9VA1y9q3LKjDtbuGvO5NuE6iRwxS3XfjOzRS8fRwhFFu45W/BI
         HXmV8DCi2VyezUKz15m4rwZ86sbVQmMANVMigNCcGrjRTKOrm63ypvaCmCwlM4lf014F
         osTg==
X-Forwarded-Encrypted: i=1; AHgh+Rowh7we0XXI9kePvOkv1AWMbPVNo7wlVgx+3aGGYMQ0dxWZZDwKGd40WHsdAweKWLg+NnkJRRc=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+R4DmuN+STJucR8pJRJZiPWHKxkQ1fXLKtUGQptPm+AFU+0a2
	WT09uy7biQlr1OC1LzPnvF8Eod2oszbFEGDO33paS5mkXaEv1z/YXu3wjgsYi9L2D8KKBp7hmqB
	fAKBAPt1fwtLtrn9U3xvW9tbLmogSJg6a9xpd21++8zhSEZwji3na+rSNiuLYCFFWJC3CQ05A
X-Gm-Gg: AfdE7cnWj2e5fpq8HaiWBIP+Oiw99jxrXXE1bSbO+ukBnkoZvEcSMXd4JfUNrAT2xGM
	AzVjA+PwiJSmioJBC4oRHpeg//MG2hOTu+yN5+MhXNgOQbtE7W+U+K54MCPyHhzpzkypJEzveAC
	HkCJcqgMS9xQG88pNJMTHFwpyZWO+dCKg6Gg+3/XspimV/c684RXHmilUxXyrGfN+i8optsrLy5
	+C36cMDpPLGutodr9yHmGmvEqlJ/tPaZT0LuUZDlqRo6ju4GJNMWLVZE7Tnxgu5neGf8+ThMvNc
	JAbvtNJ6i+7VeUyHkXocgujKX1xO6Qin7iEPRf+C3F6EfujnxewJrmEkczardd5AB7NuBoYYPH8
	dAY8GsKoBxv0KNX1sHQkOL2Kus5qHoKORF/HNmido2KdsjYPLPQOvbG44xXv2kKr+9BgnSg96WU
	Hq8vLo2P8m
X-Received: by 2002:a17:903:3848:b0:2ca:d873:3b34 with SMTP id d9443c01a7336-2cad87346f8mr12510745ad.36.1783064789279;
        Fri, 03 Jul 2026 00:46:29 -0700 (PDT)
X-Received: by 2002:a17:903:3848:b0:2ca:d873:3b34 with SMTP id d9443c01a7336-2cad87346f8mr12510515ad.36.1783064788820;
        Fri, 03 Jul 2026 00:46:28 -0700 (PDT)
Received: from [10.133.33.211] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6bd7611sm5516185ad.0.2026.07.03.00.46.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Jul 2026 00:46:28 -0700 (PDT)
Message-ID: <46b956ba-a168-4594-823e-3f27b5daadd6@oss.qualcomm.com>
Date: Fri, 3 Jul 2026 15:46:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] wifi: ath12k: fix scan command endianness on big
 endian
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260703-fix-channel-list-copy-v2-1-372c39306d79@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfX0ucl8LejjCGs
 sDSVD9zzC6hUEP/VJYet6+habjsyNMteUrGok0QoBcgO8YGrnVCXmU7nWRPh8hMHc6l4FNAbkx5
 ibQlEj9mPxHi9SrO49fnHFZU+0BzMtc=
X-Authority-Analysis: v=2.4 cv=FOQrAeos c=1 sm=1 tr=0 ts=6a4768d5 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=N9GNhs4bAAAA:8 a=EUspDBNiAAAA:8 a=gTOcNWQQRDhoJBoYzwgA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=PZhj9NlD-CKO8hVp7yCs:22
X-Proofpoint-ORIG-GUID: Iduyp5Qd-ql_fNysFKrj-pvIBDCWdoE9
X-Proofpoint-GUID: Iduyp5Qd-ql_fNysFKrj-pvIBDCWdoE9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAzMDA3MiBTYWx0ZWRfXyzlqVnLidCw+
 RJYfTtxBcmFReIDsowwvVGutb9jUbaPCVOfKNyP434+ylPK/fBULyZzf7UNIFx/0d844DuRww9M
 /iuh5OeSJxATFd849/LoKtgIxGkJ9Kll+4R/cy+JUsz/FPw+gEXOVa2XW0Jg5K8zLoSxHrNHciK
 81BOaX6E6vmRAqxNegWb1tWgj+IiAzLpP0JWuTXuKS5B5ZUCRk2I8a4PXu+XxwqldWQzAyWz6WQ
 X9Z2hKuaCAL8TBgYhT48APd5QZlPp0oBfUHCHaqYMQI//DFM7HooSZCyAIKpitMBMHDpLHOFeox
 iv7m9bqPBiIcwUZ5Nk9owo+2kGNV7UhhNC4NzNW2HuHYsOA4ihskfGgveAi98VqQitAPApp+dkA
 4qWCARGchO1gf10H+Oe65WjjfsfN5WgykfHHsh2KNk6bn7wMX+GNJEIhIx4BX/kY8zI1w7MxmG1
 5ANek2nHqkdg+v2xZ9Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-03_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607030072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260703_004630_443320_77C13D48 
X-CRM114-Status: UNSURE (   9.68  )
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



On 7/3/2026 3:35 PM, Alexander Wilhelm wrote:
> ath12k_wmi_scan_req_arg stores scan parameters in CPU-native byte order,
> while ath12k_wmi_send_scan_start_cmd() writes them into a WMI command
> buffer whose contents must be in little-endian format. The existing code
> copies the channel list and writes s_ssid and hint_bssid related values to
> the command buffer without endian conversion. As a result, scan requests
> contain invalid parameters on big-endian systems and fail.
> 
> Convert the channel list as well as the s_ssid and hint_bssid related
> values to little-endian before writing them to the WMI command buffer. This
> preserves the existing behaviour on little-endian systems while fixing scan
> requests on big-endian architectures.
> 
> Signed-off-by: Alexander Wilhelm <alexander.wilhelm@westermo.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


