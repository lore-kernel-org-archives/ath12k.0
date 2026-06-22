Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 392B2CDB46B
	for <ath12k@archiver.kernel.org>; Mon, 22 Jun 2026 10:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9v1OGWOHyglFd+5UWLROqlFEgqkKW1U6EE2JVBSssiY=; b=FU4Z05h11p5YOvxKI+SPDaC8z2
	U7Akv+sfk8ysqYQhvgOIevC/tWKCgQ+slH3In+Y5VzcwgmyJbrvSTpUN9lWFqyNW2KrFzTTU/CTXs
	TaYIWNlYBIlaMRQ32JkB2syt4I7N4WFKHKh9Vens/61jGPtnKruofm8gFR9qljZyRQ4PcwZlbqLVl
	OuvtCU6hR7nsNjV0xYXfs+yfDAagYqzJl4nYfGZyrx+py6maTzkrp+eEPc8gBziKE4wTXbp88BksC
	LEbNhqLRqH9V7BkdGZNcMNvzY6IjnmSRuettOUkp8VNj/yC0/RgURdICQP0vST5iO6mCU3uhOfGf3
	DCLNMjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbWh-00000004ny3-4Aqm;
	Mon, 22 Jun 2026 10:05:11 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbbWf-00000004nxc-2Uop
	for ath12k@lists.infradead.org;
	Mon, 22 Jun 2026 10:05:10 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65M599vi1275388
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 10:05:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9v1OGWOHyglFd+5UWLROqlFEgqkKW1U6EE2JVBSssiY=; b=Q1Dak2mZ4aqdYQ+B
	1XVWR7M68pvUQvkPSr8g/B4ov/1qIS147wPFL7iTdR5NQ/4YuNoVdKi0KjKyfO++
	MHgGZan7KRiPCEnrTWIsLPUW93sJAgdcgOX0TmMVSVouN79M8KWIBwylmpK650Ao
	cZJqv4YxnF/nlsJtS3TOi0WZZYJMyt5NmNp530l5KS7cConmyjiQ2KjjFmOusM49
	sDzsri6XE8O/ceMGuR1movxtINgL4SiMsnbB5Zo4oLEfI/FIfREwfoJgLm3WpZAu
	XGwM8cApOwknEOlpyKngOkPfRxUG1Sz3LfiAGNhFWkoTxYpeYb52e3LPwBdySzK7
	87yFBQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ewk32x1e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 10:05:08 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-8428384f31fso2997391b3a.3
        for <ath12k@lists.infradead.org>; Mon, 22 Jun 2026 03:05:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782122708; x=1782727508; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9v1OGWOHyglFd+5UWLROqlFEgqkKW1U6EE2JVBSssiY=;
        b=icLMp/cdxpIz86pBvx/F7qERFXrAbfGflhN8Y3vvFENUDCmsSun7d2GcueJJCv7KH3
         H3ug+xS2SNd4JFuyDq0Qi8HoCXTP35LrAM7hxpzmZu0YmKK3z+PHWYCtmDz0E1mHXpUL
         LZIJv+Ak4yhuwugpknwLz3T7cHCbysC3CqSjfgf7zsqQXi7eZDV4P/z9qybm5m30AvVx
         Ip0ehzYFXWI56vZbBFrwPsa03diT4iC4eCpLP66L7jaYMlgHQBDdFhgwElfg97JJYswz
         ARuVJFGoX20OMPRxyrV7r25TN4Zcj6q3shU8mCVsceQDm54EjYGHvqr6nQUrKWq3uDiR
         BHqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782122708; x=1782727508;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9v1OGWOHyglFd+5UWLROqlFEgqkKW1U6EE2JVBSssiY=;
        b=hzkBtgKGd/0uruAWwiLrhEMvYkSQ59jy/hdYpzJJi8TQjYXOrFNTFKzyIIvGrAsuY9
         N6qZ5ZFk+emAKmrARiuM6BaYNp0Y7gqDqtSNa17JuYED9AnZ1ZScQg4zzc0VZtySriZh
         +U3JjRIpR9EreIv35L7/TsyrL/EkWGf7H4FBNAsTsziOKdXDoPqKYD06JKtNAEtBFHSr
         M/l0Oh29NZRJScdkD8+2HBzmk17O0CDbyYJoDHQCa21Zf8h3xZGfZzHH+hUXYzvclk/N
         CO/I/BctyNkPceiL17G2itcWV0rrngZgrii+pINbGk6RApGwgWYB6N/Z4L2yL9XqKEvy
         RdqA==
X-Forwarded-Encrypted: i=1; AFNElJ9MlhTQ1ioAFi6xGqE8PsiEktvZqaKX8+WTvxyeZr/i13o0QA+rD0CAy32DfEgJ2fPBDyNwWfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YyIud1vS2XvouDtYB5MbXpKMs+bllONqPPYpt5hBJXcjUcConZK
	3S+yCj8QVVX1Lbug88o6TJypdi0TyPs4dy977tnlG71Ix+Ou1yEiw8nQoeDpJJa1hhfBSbW+GRP
	memCvAkEDO6g6GVdLHh2TpLcxuBMa1LrA7U2ax6YWPkCZSkchOGrr8l5kBxKdOgs4
X-Gm-Gg: AfdE7clzxTOKpoWuacPo1itY4HsKigBd5b2wakgquPoKJliwErID/QkpxG7pqi2oo01
	Q1e+gH67CzAvJ/AeN/ItEiaMN2Fc6Ck8G/CWkynxtFiMWWeTPcpkyEaWvpO/X+BhnBFBNbovpXs
	aIFB97/TxkcAQyuiDvo74xBGHs1dLj/Iilnfpk9D9CoKWH1xOiB5Ec4ixiEGz2ncleRDFqIYgXo
	ucKKeCYzS5XRPkIyb3n68jd9ae40xQI6lC5aa8hz7771uUQJBsR8icXXPGvVrQLnugs3xtyBc8F
	IG8pcMl948pSUZSjDQSten9j7RBjPp6ZI5/yePI1MfIrZOlcqMqSOUgkRqABEXpcpFmKuWFlcJi
	12frx1hF4ZbSaAQWv8Sfa3k3nT1oIupSp3bler8pAW7zqZtgVP2x7kiO9K9SCHUf37WQotgoHgw
	eg55WoONqf
X-Received: by 2002:a05:6a00:2d8b:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845508bb8camr15391407b3a.34.1782122708340;
        Mon, 22 Jun 2026 03:05:08 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d8b:b0:845:44c7:2fdd with SMTP id d2e1a72fcca58-845508bb8camr15391363b3a.34.1782122707756;
        Mon, 22 Jun 2026 03:05:07 -0700 (PDT)
Received: from [10.133.33.165] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564e7480csm7030891b3a.33.2026.06.22.03.05.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Jun 2026 03:05:07 -0700 (PDT)
Message-ID: <9bce4b31-0096-4301-8262-d248988ef70f@oss.qualcomm.com>
Date: Mon, 22 Jun 2026 18:05:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Reduce RX SRNG interrupt timer
 threshold to 200us
To: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260622062324.758533-1-thiraviyam.mariyappan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: fG2z-MnVMZGZWyS9XcD3O8C90owaQxBc
X-Proofpoint-ORIG-GUID: fG2z-MnVMZGZWyS9XcD3O8C90owaQxBc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjIyMDA5OSBTYWx0ZWRfX4N1Vp21Rccr0
 0PufuKIuWLkMVBErMSi/Ozk57m9Cu8KQk6HHxaQc/ISbZm3RFmlwsCfSwlWcbuklLhWTv9DmgWP
 FRwkZ7j311sjl9/GmSZHeAbtCYCmmj0=
X-Authority-Analysis: v=2.4 cv=NovhtcdJ c=1 sm=1 tr=0 ts=6a3908d5 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=6v9ovjmckxnE5_8N7CcA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjIyMDA5OSBTYWx0ZWRfX9P+pjnSRilxn
 IehhJyzucTM/VS5F75rCOWz8tbZVjiuOQ8jNafw6Vu4zbM2N1eMMKoN+CaNgmaWyiHoAdk8Xo8l
 OIIOF9eSWtkUGOlxFUoizn4bwF/1vheZlKBBfSJt496B5i9dRVhXKh0NnVeJ4SG2MjqabtpLKgx
 vNkvU+SUzJpp+Slv9hlpX1GZglqnfXQTq/kSY/c3Rl7NAqsCA9zP6FwdCaJZSIEeHzrB3mpCuRh
 FhhDwaMaubrRBd7ho9eJE5fcxwCdbnz/KQcWKHsmo9sfHw6etQx09JfuEPYByPpr7WFFktIbf8z
 KqRyEwD2icBcwO2Xgq1HBcVBbNedE25wFRA1aNzt+opkiJcg/+LcEPm+tFixFU6YrIuQ3dCQaVo
 5DblbDnP5KqG20F9/HDALqHSSSFmYf4qhcUDTATOfS0o0aIxji1116Phsg7HHASlw/6Sw31bTi1
 ZcAu8CgyNMVB6/Ywipw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-22_01,2026-06-18_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606220099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260622_030509_662540_01320EAC 
X-CRM114-Status: GOOD (  11.29  )
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



On 6/22/2026 2:23 PM, Thiraviyam Mariyappan wrote:
> Currently when RX traffic is low or intermittent, the RX SRNG interrupt
> mitigation logic defers packet processing for up to 500us via
> HAL_SRNG_INT_TIMER_THRESHOLD_RX.
> 
> This causes excessive RX servicing delay, leading to increased end-to-end
> latency and degraded TCP performance in low-concurrency scenarios.
> 
> In single-client single-stream TCP tests using 5G EHT160 (NSS 2x2) mode,
> throughput drops to ~400 Mbps DL and UL instead of the expected ~600 Mbps.
> 
> In addition, UDP UL end-to-end latency measured in 5G VHT80 (NSS 4x4) mode
> increases by up to ~48% (~570us versus ~270us) across frame sizes from
> 76 to 1518 bytes in uplink and bidirectional traffic, indicating delayed
> RX servicing under sparse traffic conditions.
> 
> To address this issue, reduce the RX SRNG interrupt timer threshold from
> 500us to 200us so that received packets are serviced more promptly under
> low-rate and intermittent RX traffic.
> 
> With this change, single-client single-stream TCP throughput in EHT160 is
> restored to expected levels ~600 Mbps TCP DL/UL and UDP UL end-to-end
> latency in VHT80 returns to baseline values ~270us across all tested frame
> sizes. Under high RX load, no throughput regression is observed, as RX
> rings are already serviced frequently. The primary implication is a modest
> increase in RX interrupt frequency under low traffic, with no observed
> functional, stability, or performance regressions on tested platforms.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <thiraviyam.mariyappan@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

