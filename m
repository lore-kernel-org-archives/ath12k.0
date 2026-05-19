Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDADECD4F5B
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 19:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ktk1Kw/2lKXymr7q0r8FC8lBygPFZMuhBa1Igu7Okfs=; b=MH/UWb+B0TvaDbGAkXJEZbSp3l
	0EeY8RPdwuHwKiKoLQmjCR4VW4bJ2irMVff34GI51O4BgnxwX9cYUUndbwNkNbUfLoyUX9zQVTHcs
	B51/m77g/P4jvclZAPvDT1ms5yNXjyBB47Xrzqj2qDzSBte5G5xyydykppKfGbcDuiA9xJdKaHhQY
	Z/yNw5SfrLILEegM4Jn+qX3J4MNWCxnJfxgLw8PeCYNnqn9P5g//OW1s0Z3l/H4Wj0Jtc18QgsFIV
	0adgS+SsSZF8ccAkDOchpjJeCA3ZAKfum1qhpXnxrj4EdI0LRcdwGF9bzR/kMLxg7+jDcZ4OOk66M
	9y55Pk5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPvC-00000002b5n-2NBX;
	Tue, 19 May 2026 19:16:06 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPPv9-00000002b5B-0A7n
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 19:16:04 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64JEwpr21637044
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:16:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ktk1Kw/2lKXymr7q0r8FC8lBygPFZMuhBa1Igu7Okfs=; b=oWGmroFR1J4jsEh8
	gOJHoUJiiSN02ZcizJr7a5Cu5CSYMZtIKKI4BPI7M4wpNdm5ZHdjaDUpIg2P3rXO
	e9clLxXMaUqIhUe/9uetEe7OLwQkll4sqj/w4ELO/Hnfr5J/ZbFm7pPeZspaO+6L
	wvl4lvL72+pj6I923B79QTA4HJ0+FNt5GjEs29JLt7bQTzG4RMaCKjCbvqbldBOS
	seFM2O7AzIGtCU18zCgmCcyR0ewtJCK9DZnFeaWLXq/OukW+n3e8J41jSmOkasCP
	GY2C2CzliCOuzqNQGT6seYsr973wXjpgnHbGsGi5kBNKjGs39Ye6+nrY9bpOx6I1
	ktTVqg==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8t3s9466-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 19:16:01 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2f3eb8f3419so753466eec.1
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 12:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779218160; x=1779822960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ktk1Kw/2lKXymr7q0r8FC8lBygPFZMuhBa1Igu7Okfs=;
        b=TQfHw04ItYtghNEiildw0dwjI7gmqGC1YOKvtJQH6qiTODu0+H6XUAZZPpvGcaeUQ+
         6sUXnSjWg/7sIL7OEs1B8k74q/akWRP/ftwe/R2OSROgPeJTU8pvXS4njHQL29An3YHt
         u8g763Awj3MPuY1A3fFw1TZHzBshisaxvzH5gqenO8gthKlTCNneOMmIRHtbJPHTSAV+
         RzpLu8JKiPA8hsr97X8vQpmkY/GEyuXiVzuGc8/IU3PkHH7tkUh62PWpIXrzWN5X2Yeh
         PU+f6heEWQBRLTs1KVNV+1fOpVkAgRVmAQ+blhn5oHCZEyACyxeETgly/bzm8cPgmgLi
         jE5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779218160; x=1779822960;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ktk1Kw/2lKXymr7q0r8FC8lBygPFZMuhBa1Igu7Okfs=;
        b=RvtyRdo/0u3C+l8g4TH79stX1iJGDCME6caMhIL1H3Zt28D0/8fqd5EEWOmOJGUo9h
         ZwKev0cng2iOtUF1HErk5KRQUJsiZj1gMfmlxrFbmbFX8WOZ6dSV5UWN78q8eW2mceR1
         cJSk06if7oDfxkUoplDQicFeOPXLvsmdPgkBZz2BHEhZHuU+F8GL3Y8jlcMPKGajppdl
         zTt4OOdjpEtSFwju6bd/BzIs/E9Na1Z5XR89/cUVT+ht1wzBNKHbxWGJTCG1gGS8rLKk
         95KDhy7ADGmLieSw9s55TvoCWoBZqcmKcaMJd7tEewDzIw1Fspyvk1OclLWa+XiW0tPd
         voww==
X-Gm-Message-State: AOJu0YzQDhPLjVrVI5nB9QQ06QVuDNyp41w5u8f7roKhVd/7kp43Mp42
	rdPWLwN/CO8I7UUvQ83K7190VCCuld6ARwqSQd1iH/oPuDBJ7gy4NVz8tf7Q83GsQ+R9YgXGsVu
	Y0FSYWpAZudQ0gOAjyIrLPE3s8FKpX1NZJJmPAOpIpAsslQTWjXYTGSh4H5RBF5bziCa6QIP1
X-Gm-Gg: Acq92OH5Wba4nRyRChkJr2RqLMud3lzzALgZqJUvd+U1Yb7axXdmsex/7F5YnmaSENV
	WDbxx9JWobnXqC2zMoE4hiBFeNW/Dnq4P5KffQwVHloGQEMK3+41penksYeMdPQ7VrL19hzReeg
	n/PqQuT4t+/ivm/imZ0DCjiFZrFP4iLE//BQoH/39OnPgtpgDMbFzf8QdV39biE0OOwoSC4MnJN
	hknGcuZCqEjzldoPAdxbt20tf7+2QnGoIh7ocoElXb1WZ917YAGPdeJVo3zKm9+OLFXYaplewKB
	UTGXbX7CoepE1tp6iUIv/c2SYF0NI2kSBr9bZVwg6EZq5jgwiyK3aItN3nKrA0APDhhN9pxP7r5
	N7ubg9sqmDZ855ryzp351ywVLPY3UiohDI67IvoYW0jikTkriNcwfWZUa3VfHhtKNEoruKraBap
	NA
X-Received: by 2002:a05:7300:7490:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-30398191413mr10668182eec.5.1779218159878;
        Tue, 19 May 2026 12:15:59 -0700 (PDT)
X-Received: by 2002:a05:7300:7490:b0:2f2:1b3c:d832 with SMTP id 5a478bee46e88-30398191413mr10668153eec.5.1779218159328;
        Tue, 19 May 2026 12:15:59 -0700 (PDT)
Received: from hu-jjohnson-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30296dcb6adsm19282532eec.15.2026.05.19.12.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 12:15:58 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: ath12k@lists.infradead.org, Amith A <amith.a@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org
In-Reply-To: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
References: <20260511040242.1351792-1-amith.a@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Add support for handling
 incumbent signal interference in 6 GHz
Message-Id: <177921815834.82778.2748075347158280924.b4-ty@oss.qualcomm.com>
Date: Tue, 19 May 2026 12:15:58 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE5MSBTYWx0ZWRfX22uC+15gEII6
 jo3swgKhc8pWbE6IpvTJ55G/umI4EQ2kFK5C8gkp5KQ2i5H2Q2kB2SorNvkSpjhi/wKWqeR+P6u
 mzwWvZ6h0kjcJ4Dur60RA+Yfwnrlaq8+WLDbU7GFc6RygHS3oRl4y9k83Es2/zh06kd7Sn52QEJ
 jURWFXPQABtLDupVAfSw5H3QnRmoPm6H/hjuZsKRIFhrU8yDTttn4bJFS9Nwn5FdOiEMOvzi34s
 /nB2emXqLrBJ4hvCMl/YZJiNMp5lOST9CWL/ePqWH6rS5MOZf/Re9RDNoLs3zcCslq0cxUwa1bT
 6pVkbKx0pZKwkU02dBSSvPlYs2pg8gy8Ai3M/TYHXpyiJH66EcJ18fCZe3nWuhiQMlZbHbIkW0J
 g+mqeQxDZbadhrzwDyy2RqL8ahd7m2QVLN42PkpUTrKwH5K8O/z9XLRnz0d7vpV28B+Ea3ivzZt
 Vwj0BX3JiqgAwEN2AQw==
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6a0cb6f1 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RB24T4HKk-RwX4x9OpgA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: zyOKj8NmDvetJwCMZCxpvx05F5mOF_jW
X-Proofpoint-ORIG-GUID: zyOKj8NmDvetJwCMZCxpvx05F5mOF_jW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_05,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605190191
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_121603_199644_2C828551 
X-CRM114-Status: GOOD (  14.42  )
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


On Mon, 11 May 2026 09:32:40 +0530, Amith A wrote:
> This patch series adds the implementation of handling of interferences
> due to incumbent signals in 6 GHz channels. When an interference is
> detected, the firmware indicates it to the host using the
> WMI_DCS_INTERFERENCE_EVENT.
> 
> The driver is expected to parse the new WMI event to retrieve the
> interference information, validate the interference detected channel and
> bitmap, and indicate the interference to mac80211, which then notifies
> this interference to the userspace.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: Add support for handling incumbent signal interference in 6 GHz
      commit: e7f9be2c7bfff07b5aba1e6eac3452cd729ad214
[2/2] wifi: ath12k: Add debugfs support to simulate incumbent signal interference
      commit: afa1bd86eddd9f395bfa3d5cb3c7b5158e1383e0

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


