Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14460CA5FFD
	for <ath12k@archiver.kernel.org>; Tue,  6 Oct 2026 02:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YhucmCh5FxYyQPtDcrrIyrj+mpj18kkTGljq3E1yG1Q=; b=PpovgATqJsnhLPgkDIrIw9zBHt
	g6vyBCegrMEtcTerwiJTcueuSlGsoaGbmS98P67cLtOmdjjL1rQZiN364gIE4rfMfOpa6D6lHxNES
	sFXszCqUxVxvc0wtuuCbJvrfnyUV3NWGrqOuxyDSB3nrHkyobr5zi48K69gOkWjDuIZ1DHXXM9IFC
	AMxmt1g0amNkdNQ/uvBZjSguNz/LFS5FExXsTWecRIcWEIUwpUWCJNmq/qAKFDZcmjUqsre6bGFkX
	Pce2RDqq8dYfvlm7a2R96g8NVxn7iYM4jvYmVFhbdlt6TKZeOtUJf/yK3uPQfCYUsbRr+BWvKwfbk
	ebezrBDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuin-0000000HUaN-32x1;
	Tue, 06 Oct 2026 02:16:01 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDuil-0000000HUZp-0BGD
	for ath12k@lists.infradead.org;
	Tue, 06 Oct 2026 02:16:00 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 695KOTTQ3434906
	for <ath12k@lists.infradead.org>; Tue, 6 Oct 2026 02:15:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YhucmCh5FxYyQPtDcrrIyrj+mpj18kkTGljq3E1yG1Q=; b=gsIJgmiOypuR2sDJ
	SXT5AQXx6sANhNgMD+Z6HQ3ZekiQXF9xMUEw/NgWZrbzw4/OymMGlAKWTMvtZewJ
	Zl1ZVUCSV586BrvqQ79mQUi3qWgPq7k3Po9lfu5646d3Cugd6cyA/wFmsKtfwHOp
	f9zlgiZ0LhWKGAfuBL0a4syi1gPgKHL3P8oV7zm/AZDiznpHbUROyvEpGaPl7fVI
	14r3AXAk7SBMajP8wssi7oWBIx25UpGYuivq5XGOVC0+K85dY/nox4q8LhH3ptPJ
	9asLHBprjPui82RvxlNojhA3lHT01Z2kHk1dH9kDRPUWQJ4IK0jLibVvQWF7rlp2
	5tAWCA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h49tvu6j6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 Oct 2026 02:15:57 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1384427c3efso3361984c88.0
        for <ath12k@lists.infradead.org>; Mon, 05 Oct 2026 19:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791252956; x=1791857756; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YhucmCh5FxYyQPtDcrrIyrj+mpj18kkTGljq3E1yG1Q=;
        b=YVMrIFD+T1BbuLbAhryC6LsCuTnbTEov4fWGp/1xpO2CnUUDA76NKbrd+yCdVu248+
         R6C6sIe/7b6B8FPQt+Ofaz9RjQ7SX9Z2ywQ77lbNx7gwkBwpOAGhDJXY/ZO/pdtrnfts
         GBUqRbsx3el8Fz/IH61M8BtaWnGGSrxJS2rKTNPnc68hcFYsUGaVqzaji8uaFVKDX4Ux
         NmoDXYRsARGu6R6Jomu9evayOqaXAbVFwaL1/kwlFhKNuK2jbMDKRyfoAR0zqoJBsSVk
         y8qqtwXA9rO61SkUy5QWYtcdmzcNm1dp48fWJZdp+SOig314svbkMBJpvXyQvmERIt6M
         KRLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791252956; x=1791857756;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YhucmCh5FxYyQPtDcrrIyrj+mpj18kkTGljq3E1yG1Q=;
        b=Kj+TKS5sN7tLbcMWTh9909NolSXSy5Um71J0ta6m4DgOPQF0nNjtw5Gdym4xy/fSub
         vvNEDKb43A6d6M4OjuzfvY/Uq3nbHNsG4xceeUbRtIh/j0sC6EhONUMeE6lF8ulXLnG2
         vUNiE4Qal/cfSHABiV4HQ8nkpIDJ2cqiBjcRYSLCZtdKE+u7LFdcBQPqS0uCe5zJgmzD
         Nx+C85f3+6Ylho4RHvkeO0SFPRhrWwJYdgi3gCWLJGu/QvrG291dkkOLCgy7gX8m1LzW
         tgyu/GSqlwuT2kPwf7cP6Wi2qAr3HCcwud8tZpF9OnqLEN38ftqhj37yIF7GV0di4nYg
         T1GA==
X-Forwarded-Encrypted: i=1; AKwUvByTnpvldW1aW8GOSoKCkx43+BkGaN3jle5tsE+fnWsdSRpJ059DR8mDQYqEzDLKLQXqEwknzs4=@lists.infradead.org
X-Gm-Message-State: AFuF++nqvVtba+CeO1y8g3DebOPweLl6WErf9w33xk47tlQUUMguCUbQ
	Xc2wXgghRU9Ga1ts0wCdijdKrxxlX7YbRMP1cCbc+SFrBtTaitTE+rIZQa0BTAz/TAtxiS+U+uv
	mdPGoTs68ureG8GTws4CI8nUZlI0oOtY0vVgBom7BJYcNFYaZHH67fK8Xs9MgHnqT
X-Gm-Gg: AYBFou1cyAdV9dtN+9PC5/Q+5N1mkUk3UyHPSUKLzYsywTvQnhQ48ma1NkTP0150QyG
	aq3Wo4w4Brv6yDGNlfze/+XIBHaHcVVVuVJr13uEUyrKi1cYS9RZv7RvcvGuiFGSRHj3he2XOvO
	LokQM6bGzOqpnY8ftKPVK3dB5YmZalo8D75t4pOilRDevUDCQ0VHlzKLvqdzMNInThUQQaJf5hI
	JC/GFNGpAqg01YyVrf428KtBftVvfmCqL4Le9dklktbdAiDZiOEwNIhGhgDA7eLGUsmD8LapZdn
	FKK+eM0cTb4ncDJeITS5q16H6x7Z4hFNF3v8Uet0bp0dvh/CZ9Xs7bEp9RzqthEGZmTJhG8r0XO
	auNqqEvw6hgAmU3ZG6pp2BOEmVPm9BSPaQ9JoAMtlg3PjCUEOWC4qt8KKjw==
X-Received: by 2002:a05:7022:5f02:b0:15c:1679:1ce8 with SMTP id a92af1059eb24-15ecb4afc11mr102598c88.31.1791252956294;
        Mon, 05 Oct 2026 19:15:56 -0700 (PDT)
X-Received: by 2002:a05:7022:5f02:b0:15c:1679:1ce8 with SMTP id a92af1059eb24-15ecb4afc11mr102513c88.31.1791252953653;
        Mon, 05 Oct 2026 19:15:53 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-15d852a56bfsm2299440c88.15.2026.10.05.19.15.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2026 19:15:53 -0700 (PDT)
Message-ID: <d9eb2d99-79f5-4e18-8c6d-4877c73cd5c6@oss.qualcomm.com>
Date: Mon, 5 Oct 2026 19:15:52 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] wifi: ath12k: service all RX rings in an interrupt
 group
To: John <dencity7@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <CA+KzPsr13czsH=k_UWJqj48C4Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CA+KzPsr13czsH=k_UWJqj48C4Vsb-diQ-tiCh7W4XW31E8WzHg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=aN9lOr9m c=1 sm=1 tr=0 ts=6ac459dd cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=_95Yl18s_qG07WKI7q4A:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-GUID: UCfXFPaBZP7t8ga0pbBoLdMClypRacFg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAwOCBTYWx0ZWRfX6amI/kur2tJ/
 OwMXEtY7Fwjmd8x3h03j/SpiegWJshc2am+SOeJRxWFBFl3mqd4GyUiI0chj+VKHNC0H0sUMF97
 z6ohD8HKoSW4EsnugzeVbC0w7j+mLmJYxsWlcge8EBvySW/T4T7cDKUTWDHGYVlOy82w1QU3GPz
 SdsL6GiFGnufiEf+a0jAQ8MUcHZLk9coh6SoiWQSD1F8ze3on3/AeiJTC7ibVN/HDFN+D8ERMmz
 bl5yJ/890mPbujAISyNB9JMqzMVsCTUoxvc6z4CPfNViBagUfWSKq/yBuzhFk3KK5B72QeG3Ojs
 gRe1sg99dloTa0uLNzckZAZGfKYbFATnYv4DWJsUALo0P/3AoJWceUqnhqFPxntRTeVfSY06c+b
 SXYkt+Usq+buZqxvt9JDt3pk55R4NTNser4YPQhFT+ZCMZwF8dEhS/phfOjo+2sfhkdSNU4OQ1u
 lDhHGDtD1LX6qZfoRng==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAwOCBTYWx0ZWRfX6c8bt7M29xaZ
 KDyCu/edmV7SEjh1GzExXasASPVJaLRPHHydI7YNVDw9l7m4/sKyUxN6MGJJ3uQLLW2NtSjZIZ4
 8I77ossW6XikGK7C1OdAIC8D60sb1Hc=
X-Proofpoint-ORIG-GUID: UCfXFPaBZP7t8ga0pbBoLdMClypRacFg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-05_05,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 clxscore=1015 spamscore=0 phishscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_191559_206645_B058D8D8 
X-CRM114-Status: GOOD (  17.07  )
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

On 10/5/2026 5:48 PM, John wrote:
> An RX interrupt group may select multiple receive rings. The Wi-Fi 7
> handler currently services only the highest set bit, even when the NAPI
> budget has room for work from another selected ring. Walk all selected
> bits and retain the shared budget and existing early-exit behavior.
> 
> On a locally adapted GL-BE3600/QCN6432, group 5 selects bits 2 and 3. A
> host regression built from the actual RX block completes 3 of 6 queued
> packets before the fix and 6 of 6 after it. Single-ring, empty-mask and
> two-poll budget cases pass. Descending priority is unchanged; this does
> not establish fairness under sustained traffic.

see:
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

For a datapath change I'd need Tested-on: tags from both WCN and
QCN chipsets since they have different requirements.

> 
> Signed-off-by: John <dencity7@gmail.com>

See:
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

> 
> ---
> RFC validation and limits:
> 
> Source applicability and the host regression were checked against
> backports 7.2 plus the 230 wireless patches from perceival/openwrt-flint3
> commit 2365932733ca8ec3b346621d9cec2eb3df3b2cf3. The new patch applies
> with zero fuzz. The same source-block regression and exact patch
> application also pass against official ath.git main at
> 388d3c42e8aba1cfc3c6d2c52877a46d8cf740db (zero fuzz). No full module
> build or hardware test was performed against either current revision.
> 
> Historical tests on Linux 6.18.39 with local backports 7.2-rc4/QCN6432
> changes passed DHCP, DNS, 32 UDP flows and about 181 seconds of traffic
> after reboot. These are bounded observations, not throughput or long-term
> stability qualification. The contribution was developed with AI assistance.

see:
https://docs.kernel.org/process/coding-assistants.html#attribution

> 
> --- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
> @@ -52,8 +52,10 @@
>  			goto done;
>  	}
> 
> -	if (dp->hw_params->ring_mask->rx[grp_id]) {
> -		i = fls(dp->hw_params->ring_mask->rx[grp_id]) - 1;
> +	ring_mask = dp->hw_params->ring_mask->rx[grp_id];
> +	while (ring_mask) {
> +		i = fls(ring_mask) - 1;
> +		ring_mask &= ~BIT(i);
>  		work_done = ath12k_wifi7_dp_rx_process(dp, i, napi, budget);
>  		budget -= work_done;
>  		tot_work_done += work_done;


